//
//  DecodingError+Log.swift
//  Toolkit
//
//  Created by Oscar De Moya on 2025/7/7.
//

import Foundation

public extension DecodingError {
    func log() {
        switch self {
        case .typeMismatch(let type, let context),
             .valueNotFound(let type, let context):
            logger.error("Type: \(type)")
            context.log()
        case .keyNotFound(let key, let context):
            logger.error("Key: \(key.stringValue)")
            context.log()
        case .dataCorrupted(let context):
            context.log()
        @unknown default:
            logger.error("Unknown DecodingError: \(self)")
        }
    }
}

extension DecodingError.Context {
    func log() {
        logger.error("Context: \(debugDescription)")
        logger.error("KeyPath: \(codingPath.map(\.stringValue).joined(separator: "."))")
    }
}
