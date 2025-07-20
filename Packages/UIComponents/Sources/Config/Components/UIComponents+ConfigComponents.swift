//
//  UIComponents+ConfigComponents.swift
//  UIComponents
//
//  Created by Oscar De Moya on 2025/7/18.
//

import Foundation
import SwiftUI

public extension UIComponents {
    static func configureButtons(with config: any ButtonConfig) {
        Config.shared.button = config
    }
    
    static func configureTextButtons(with config: any TextButtonConfig) {
        Config.shared.textButton = config
    }
    
    static func configureTextFields(with config: any TextFieldConfig) {
        Config.shared.textField = config
    }
    
    static func configureNavigationBars(with config: any NavigationBarConfig) {
        Config.shared.navigationBar = config
    }
}
