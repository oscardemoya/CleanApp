//
//  Logger.swift
//  Networking
//
//  Created by Oscar De Moya on 2025/7/8.
//

import OSLog
import Toolkit

let logger = {
    Config.isLoggingEnabled ? Logger(subsystem: Bundle.identifier, category: "networking") : Logger(.disabled)
}()
