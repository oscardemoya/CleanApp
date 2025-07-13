//
//  Logger.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/12.
//

import OSLog

let logger = {
    Config.isLoggingEnabled ? Logger(subsystem: Bundle.identifier, category: "data") : Logger(.disabled)
}()
