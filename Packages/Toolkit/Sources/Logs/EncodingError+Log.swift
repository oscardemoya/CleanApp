//
//  EncodingError+Log.swift
//  Toolkit
//
//  Created by Oscar De Moya on 2025/7/7.
//

import Foundation

public extension EncodingError {
    func log() {
        switch self {
        case .invalidValue(let value, let context):
            logger.error("Invalid Value: \(String(describing: value))")
            logger.error("Context: \(context.debugDescription)")
            logger.error("KeyPath: \(context.codingPath.map(\.stringValue).joined(separator: "."))")
        @unknown default:
            logger.error("Unknown EncodingError: \(self)")
        }
    }
}
