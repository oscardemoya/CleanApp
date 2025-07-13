//
//  CleanAppAPI.swift
//  CleanApp
//
//  Created by Oscar De Moya on 2025/7/6.
//

import Foundation
import Networking

final class CleanAppAPI: API {
    let environment: AppEnvironment
    
    init(environment: AppEnvironment) {
        self.environment = environment
    }
    
    var baseURL: URL {
        switch environment {
        case .production: "https://dummyjson.com"
        case .uat: "https://dummyjson.com"
        case .staging: "https://dummyjson.com"
        }
    }
}
