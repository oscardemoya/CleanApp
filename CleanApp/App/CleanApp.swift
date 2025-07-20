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
struct MeicoApp: App {
    init() {
        logger.info("Environment: \(AppEnvironment.current.rawValue)")
        DesignSystem.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            Group {
                LoginView()
            }
            .environment(\.services, ServiceContainer(environment: .current))
            .designSystem()
        }
    }
}
