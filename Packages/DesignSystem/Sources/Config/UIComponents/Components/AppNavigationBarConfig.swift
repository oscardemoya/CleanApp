//
//  AppNavigationBarConfig.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 9/20/24.
//

import SwiftUI
import UIComponents

struct AppNavigationBarConfig: NavigationBarConfig {
    static var shared: Self { .init() }
    let textStyle: TextStyle = .large
    let textCase: Text.Case? = .uppercase
    
    func titleColor(_ hierarchy: Hierarchy) -> Color {
        switch hierarchy {
        case .primary: .primaryText
        case .secondary: .secondaryText
        }
    }
}
