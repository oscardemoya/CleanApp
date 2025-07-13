//
//  Environment.swift
//  CleanApp
//
//  Created by Oscar De Moya on 2025/7/1.
//

import Foundation
import Toolkit

enum AppEnvironment: String {
    case staging
    case uat
    case production
    
    enum BuildConfiguration: String, CaseInsensitive {
        case debugStaging
        case debugUAT
        case debugProduction
        case releaseStaging
        case releaseUAT
        case releaseProduction
        
        var environment: AppEnvironment {
            switch self {
            case .debugStaging, .releaseStaging: .staging
            case .debugUAT, .releaseUAT: .uat
            case .debugProduction, .releaseProduction: .production
            }
        }
    }
    
    static var current: AppEnvironment = {
        let configValue = InfoDictionary.string(for: .configuration)
        guard let configuration = BuildConfiguration(rawValue: configValue) else {
            fatalError("Unable to initialize Environment with rawValue \(configValue)")
        }
        return configuration.environment
    }()
    
    var isProduction: Bool { self == .production }
}
