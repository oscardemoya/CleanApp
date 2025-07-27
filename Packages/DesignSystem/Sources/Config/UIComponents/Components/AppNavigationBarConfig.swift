//
//  AppNavigationBarConfig.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 9/20/24.
//

import SwiftUI
import UIComponents

@MainActor
struct AppNavigationBarConfig: @MainActor NavigationBarConfig {
    static var shared = AppNavigationBarConfig()
    let textStyle: TextStyle = .large
    let textCase: Text.Case? = .uppercase
    
    func titleColor(_ hierarchy: Hierarchy) -> Color {
        switch hierarchy {
        case .primary: .primaryText
        case .secondary: .secondaryText
        }
    }
}
