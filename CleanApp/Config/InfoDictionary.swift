//
//  InfoDictionary.swift
//  CleanApp
//
//  Created by Oscar De Moya on 2025/7/1.
//

import Foundation

struct InfoDictionary {
    enum Key: String {
        case configuration = "Configuration"
        case googleServiceInfoPlist = "GoogleServiceInfoPlist"
    }
    
    static func string(for key: Key) -> String {
        guard let configValue = Bundle.main.object(forInfoDictionaryKey: key.rawValue) as? String else {
            fatalError("'\(key.rawValue)' value not found in Info.plist")
        }
        return configValue
    }
}
