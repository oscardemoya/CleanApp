//
//  Codable.swift
//
//
//  Created by Oscar De Moya on 19/05/24.
//

import Foundation

public extension Encodable {
    var jsonString: String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return jsonString(using: encoder)
    }
    
    var jsonData: Data? {
        jsonString?.data(using: .utf8)
    }
    
    var jsonBody: Data? {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.outputFormatting = .prettyPrinted
        return jsonString(using: encoder)?.data(using: .utf8)
    }
    
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed))
            .flatMap { $0 as? [String: Any] }
    }
    
    func jsonString(using encoder: JSONEncoder = .init()) -> String? {
        do {
            let jsonData = try encoder.encode(self)
            return String(data: jsonData, encoding: .utf8) ?? ""
        } catch {
            if let error = error as? EncodingError {
                logger.error("Decoding Error [\(String(describing: self))]:")
                error.log()
            } else {
                logger.error("\(error)")
            }
            return nil
        }
    }
}
