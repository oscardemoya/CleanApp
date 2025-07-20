//
//  AppButtonConfig.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 9/19/24.
//

import SwiftUI
import UIComponents

struct AppButtonConfig: ButtonConfig {
    static var shared = AppButtonConfig()
    
    // MARK: - General
    let cornerStyle: CornerStyle = .rounded(.small)
    let textStyle: TextStyle = .large
    let textCase: Text.Case? = .none
    let maxWidth: CGFloat? = 400
    
    func backgroundColor(for hierarchy: Hierarchy) -> Color {
        switch hierarchy {
        case .primary: .primaryBrand
        case .secondary: .secondaryBackground
        }
    }
    
    func foregroundColor(for hierarchy: Hierarchy) -> Color {
        switch hierarchy {
        case .primary: .primaryBackground
        case .secondary: .primaryText
        }
    }
    
    func disabledBackgroundColor(for hierarchy: Hierarchy) -> Color {
        switch hierarchy {
        case .primary: .decorativeElement
        case .secondary: .decorativeElement
        }
    }
    
    func disabledForegroundColor(for hierarchy: Hierarchy) -> Color {
        switch hierarchy {
        case .primary: .nonDecorativeElement
        case .secondary: .nonDecorativeElement
        }
    }
}
