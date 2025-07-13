//
//  Logger.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/8.
//

import Foundation
import OSLog

let logger = {
    Config.isLoggingEnabled ? Logger(subsystem: Bundle.identifier, category: "presentation") : Logger(.disabled)
}()
