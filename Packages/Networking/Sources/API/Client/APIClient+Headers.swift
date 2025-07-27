//
//  APIClient+Headers.swift
//  Networking
//
//  Created by Oscar De Moya on 2025/7/26.
//

import Foundation

public extension APIClient {
    func addDefaultHeaders(_ headers: [String: String]) {
        defaultHeaders.merge(headers) { current, _ in current }
    }
    
    func removeDefaultHeaders(_ headers: [String]) {
        headers.forEach { defaultHeaders.removeValue(forKey: $0) }
    }
    
    func clearDefaultHeaders() {
        defaultHeaders.removeAll()
    }
}
