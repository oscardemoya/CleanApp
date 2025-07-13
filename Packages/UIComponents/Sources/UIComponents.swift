//
//  UIComponents.swift
//  
//
//  Created by Oscar De Moya on 4/03/24.
//

import Foundation
import SwiftUI

public struct UIComponents {
    public static var currentSizing: Sizing { Config.shared.sizing }
    
    public static func configure(sizing: Sizing, isLoggingEnabled: Bool = false) {
        Config.shared.sizing = sizing
        Config.shared.isLoggingEnabled = isLoggingEnabled
    }
    
    public static func configureColors(with config: any ColorConfig) {
        Config.shared.color = config
    }
    
    public static func configureFonts(with config: any FontConfig) {
        Config.shared.font = config
    }
    
    public static func configureButtons(with config: any ButtonConfig) {
        Config.shared.button = config
    }
    
    public static func configureTextButtons(with config: any TextButtonConfig) {
        Config.shared.textButton = config
    }
    
    public static func configureTextFields(with config: any TextFieldConfig) {
        Config.shared.textField = config
    }
    
    public static func configureNavigationBars(with config: any NavigationBarConfig) {
        Config.shared.navigationBar = config
    }
}
