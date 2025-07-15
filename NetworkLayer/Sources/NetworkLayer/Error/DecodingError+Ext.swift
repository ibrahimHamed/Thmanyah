//
//  DecodingError+Ext.swift
//  NetworkLayer
//
//  Created by Ibrahim Hamed on 12/07/2025.
//

import Foundation

extension DecodingError {
    var debugDescription: String {
        switch self {
        case .typeMismatch(let type, let context):
            return "Type mismatch for type \(type). Path: \(context.codingPathString) – \(context.debugDescription)"
        case .valueNotFound(let type, let context):
            return "Value not found for type \(type). Path: \(context.codingPathString) – \(context.debugDescription)"
        case .keyNotFound(let key, let context):
            return "Key '\(key.stringValue)' not found. Path: \(context.codingPathString) – \(context.debugDescription)"
        case .dataCorrupted(let context):
            return "Data corrupted. Path: \(context.codingPathString) – \(context.debugDescription)"
        @unknown default:
            return "Unknown decoding error."
        }
    }
}

private extension DecodingError.Context {
    var codingPathString: String {
        codingPath.map { $0.stringValue }.joined(separator: ".")
    }
}
