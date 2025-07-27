//
//  UIComponentsConfig.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 10/1/24.
//

import UIComponents

@MainActor
extension UIComponents {
    static func configure() {
        UIComponents.configure(sizing: .regular)
        // Tokens
        UIComponents.configureColors(with: AppColorConfig.shared)
        UIComponents.configureFonts(with: AppFontConfig.shared)
        // Components
        UIComponents.configureButtons(with: AppButtonConfig.shared)
        UIComponents.configureTextButtons(with: AppTextButtonConfig.shared)
        UIComponents.configureTextFields(with: AppTextFieldConfig.shared)
        UIComponents.configureNavigationBars(with: AppNavigationBarConfig.shared)
    }
}
