//
//  APIClient.swift
//  CleanApp
//
//  Created by Oscar De Moya on 2025/7/26.
//

import Foundation
import Networking

extension APIClient {
    nonisolated(unsafe) private static var _shared: APIClient?
    private static let lock = NSLock()
    
    static func shared(environment: AppEnvironment) -> APIClient {
        lock.lock()
        defer { lock.unlock() }
        if let existing = _shared {
            return existing
        }
        let client = makeAPIClient(environment: environment)
        _shared = client
        return client
    }
    
    static func makeAPIClient(environment: AppEnvironment) -> APIClient {
        let api = RestAPI(environment: environment)
        let configuration: URLSessionConfiguration = .default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.timeoutIntervalForRequest = 45
        let decoder = makeJSONDecoder()
        return APIClient(api: api, session: configuration, decoder: decoder)
    }
    
    static func makeJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        decoder.dateDecodingStrategy = .formatted(formatter)
        return decoder
    }
}
