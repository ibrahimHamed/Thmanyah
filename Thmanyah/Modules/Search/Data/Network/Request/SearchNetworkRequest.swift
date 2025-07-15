//
//  HomeNetworkRequest.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import NetworkLayer

struct SearchNetworkRequest: NetworkRequest {
    var host: String = NetworkConstants.baseSearchHost
    var path: String = NetworkConstants.Path.searchPath
    var method: NetworkLayer.HTTPMethod = .get

    let word: String

    var queryParameters: [String: String]? {
        [NetworkConstants.QueryKey.word: "\(word)"]
    }
}
