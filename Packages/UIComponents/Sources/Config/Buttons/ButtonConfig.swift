//
//  ButtonConfig.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/19/24.
//

import SwiftUI

public protocol ButtonConfig {
    var cornerStyle: CornerStyle { get }
    var textStyle: TextStyle { get }
    var textCase: Text.Case? { get }
    var maxWidth: CGFloat?  { get }
    func backgroundColor(for hierarchy: Hierarchy) -> Color
    func foregroundColor(for hierarchy: Hierarchy) -> Color
    func disabledBackgroundColor(for hierarchy: Hierarchy) -> Color
    func disabledForegroundColor(for hierarchy: Hierarchy) -> Color
}

struct DefaultButtonConfig: ButtonConfig {
    let cornerStyle: CornerStyle = .rounded(.small)
    let textStyle: TextStyle = .large
    var textCase: Text.Case? = .uppercase
    var maxWidth: CGFloat? = .infinity
    
    func backgroundColor(for hierarchy: Hierarchy) -> Color {
        switch hierarchy {
        case .primary: .primaryBrand
        case .secondary: .secondaryBackground
        }
    }
    
    func foregroundColor(for hierarchy: Hierarchy) -> Color {
        switch hierarchy {
        case .primary: .tertiaryText
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
        case .primary: .secondaryText
        case .secondary: .secondaryText
        }
    }
}
