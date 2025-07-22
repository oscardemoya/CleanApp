//
//  CleanApp.swift
//  CleanApp
//
//  Created by Oscar De Moya on 2025/7/1.
//

import SwiftUI
import OSLog
import Presentation
import Domain
import DesignSystem

@main
struct CleanApp: App {
    init() {
        logger.info("Environment: \(AppEnvironment.current.rawValue)")
        DesignSystem.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .designSystem()
                .serviceContainer()
        }
    }
}
