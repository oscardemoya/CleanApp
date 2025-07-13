//
//  Config.swift
//  CleanApp
//
//  Created by Oscar De Moya on 2025/7/1.
//

import SwiftUI
import UIComponents

struct Config {
    static let isLoggingEnabled = true
    static var bundleID: String { Bundle.main.bundleIdentifier ?? "" }
}
