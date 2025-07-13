//
//  DemoApp.swift
//  UIComponentsDemo
//
//  Created by Oscar De Moya on 4/03/24.
//

import SwiftUI
import UIComponents

@main
struct DemoApp: App {
    init() {
        Appearance.configure()
        UIComponents.configure(sizing: .regular)
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                TokensList()
                    .tabItem {
                        Label("Tokens", systemImage: "star.circle")
                    }
                ComponentsList()
                    .tabItem {
                        Label("Components", systemImage: "batteryblock")
                    }
            }
        }
    }
}
