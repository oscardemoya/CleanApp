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

@main
struct CleanApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.services, ServiceContainer(environment: .current))
                .onAppear {
                    logger.info("Environment: \(AppEnvironment.current.rawValue)")
                }
        }
    }
}
