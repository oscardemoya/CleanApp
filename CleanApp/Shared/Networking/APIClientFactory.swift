//
//  APIClientFactory.swift
//  CleanApp
//
//  Created by Oscar De Moya on 2025/7/6.
//

import Foundation
import Networking

struct APIClientFactory {
    static func makeAPIClient(environment: AppEnvironment = .current) -> APIClient {
        let api = CleanAppAPI(environment: environment)
        let configuration: URLSessionConfiguration = .default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.timeoutIntervalForRequest = 45
        return APIClient(api: api, session: configuration)
    }
}
