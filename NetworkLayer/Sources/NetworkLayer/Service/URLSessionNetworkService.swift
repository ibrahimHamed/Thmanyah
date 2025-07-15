//
//  URLSessionNetworkService.swift
//  NetworkLayer
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

public final class URLSessionNetworkService: NetworkService {
    private let session: URLSession
    private let logger: NetworkLogger

    public init(session: URLSession = .shared, logger: NetworkLogger = DefaultNetworkLogger()) {
        self.session = session
        self.logger = logger
    }

    public func request<T: Decodable>(_ request: NetworkRequest, decodeTo type: T.Type) async throws -> T {
        do {
            let data = try await requestRaw(request)
            let decoded = try JSONDecoder().decode(T.self, from: data)
            logger.log(message: "✅ Decoded \(T.self) successfully.")
            return decoded
        } catch let NetworkError.decodingError(decodeError) {
            logger.log(message: "🧨 Decode failed for \(T.self): \(decodeError.localizedDescription)")
            throw NetworkError.decodingError(decodeError)
        } catch let decodingError as DecodingError {
            logger.log(message: "🧨 Decode error (\(T.self)): \(decodingError)")
            throw NetworkError.decodingError(decodingError)
        } catch is CancellationError {
            throw CancellationError()
        } catch {
            logger.log(message: "🚨 Unexpected error while decoding \(T.self): \(error)")
            throw error
        }
    }

    public func requestRaw(_ request: NetworkRequest) async throws -> Data {
        let urlRequest = try buildURLRequest(from: request)
        logger.logRequest(urlRequest)

        do {
            let (data, response) = try await session.data(for: urlRequest)
            logger.logResponse(data: data, response: response, error: nil)
            try validateResponse(response, data: data, for: request)
            return data
        } catch let urlError as URLError where urlError.code == .timedOut {
            throw logAndThrow(.timeout)
        } catch let urlError as URLError where urlError.code == .cancelled {
            throw CancellationError()
        } catch let networkError as NetworkError {
            throw logAndThrow(networkError)
        } catch {
            throw logAndThrow(.networkError(error))
        }
    }
    
    public func cancelAllRequests() {
        session.invalidateAndCancel()
        logger.log(message: "🔌 Cancelled all requests.")
    }
}

extension URLSessionNetworkService {
    @discardableResult
    private func logAndThrow(_ error: NetworkError) -> NetworkError {
        logger.log(message: "❌ \(error.debugDescription)")
        return error
    }
    
    private func buildURLRequest(from request: NetworkRequest) throws -> URLRequest {
        guard let baseURL = request.baseURL else {
            throw logAndThrow(.invalidURL)
        }

        guard var components = URLComponents(
            url: baseURL.appendingPathComponent(request.path),
            resolvingAgainstBaseURL: false
        ) else {
            throw logAndThrow(.invalidURL)
        }

        if let query = request.queryParameters {
            components.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        }

        guard let url = components.url else {
            throw logAndThrow(.invalidURL)
        }

        var urlRequest = URLRequest(url: url, timeoutInterval: request.timeout)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpBody = request.body
        return urlRequest
    }

    private func validateResponse(_ response: URLResponse, data: Data, for request: NetworkRequest) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw logAndThrow(.noData)
        }

        guard 200..<300 ~= httpResponse.statusCode else {
            throw logAndThrow(.serverError(httpResponse.statusCode, data))
        }

        logger.log(message: "📦 \(httpResponse.statusCode) \(request.method.rawValue) \(request.path)")
    }
}
