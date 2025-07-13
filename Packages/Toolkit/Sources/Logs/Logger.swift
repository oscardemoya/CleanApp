//
//  Logger.swift
//
//
//  Created by Oscar De Moya on 21/05/24.
//

import Foundation
import OSLog

let logger = {
    Config.isLoggingEnabled ? Logger(subsystem: Bundle.identifier, category: "toolkit") : Logger(.disabled)
}()
