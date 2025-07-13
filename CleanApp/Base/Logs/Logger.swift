//
//  Logger.swift
//  CleanApp
//
//  Created by Oscar De Moya on 2025/7/1.
//

import OSLog

let logger = {
    Config.isLoggingEnabled ? Logger(subsystem: Config.bundleID, category: "app") : Logger(.disabled)
}()
