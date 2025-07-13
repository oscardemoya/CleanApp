//
//  NavigationBarConfig.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/20/24.
//

import SwiftUI

public protocol NavigationBarConfig {
    var textStyle: TextStyle { get }
    var textCase: Text.Case? { get }
    
    func titleColor(_ hierarchy: Hierarchy) -> Color
}

struct DefaultNavigationBarConfig: NavigationBarConfig {
    let textStyle: TextStyle = .large
    let textCase: Text.Case? = .uppercase
    
    func titleColor(_ hierarchy: Hierarchy) -> Color {
        hierarchy.foregroundColor
    }
}
