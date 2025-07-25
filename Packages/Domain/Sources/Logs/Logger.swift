//
//  Logger.swift
//  Domain
//
//  Created by Oscar De Moya on 2025/7/12.
//

import OSLog
import Toolkit

let logger = {
    Config.isLoggingEnabled ? Logger(subsystem: Bundle.identifier, category: "domain") : Logger(.disabled)
}()
