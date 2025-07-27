//
//  UIComponents+ConfigTokens.swift
//  UIComponents
//
//  Created by Oscar De Moya on 2025/7/18.
//

import Foundation
import SwiftUI

@MainActor
public extension UIComponents {
    static func configureBorderWidth(with config: any BorderWidthConfig) {
        Config.shared.borderWidth = config
    }
    
    static func configureCornerRadius(with config: any CornerRadiusConfig) {
        Config.shared.cornerRadius = config
    }
    
    static func configurePadding(with config: any PaddingConfig) {
        Config.shared.padding = config
    }
    
    static func configureSpacing(with config: any SpacingConfig) {
        Config.shared.spacing = config
    }

    static func configureColors(with config: any ColorConfig) {
        Config.shared.color = config
    }
    
    static func configureColorShade(with config: any ColorShadeConfig) {
        Config.shared.colorShade = config
    }
    
    static func configureShadow(with config: any ShadowConfig) {
        Config.shared.shadow = config
    }
    
    static func configureBlur(with config: any BlurConfig) {
        Config.shared.blur = config
    }
    
    static func configureFonts(with config: any FontConfig) {
        Config.shared.font = config
    }
}
