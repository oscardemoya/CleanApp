//
//  UIComponents+Config.swift
//  UIComponents
//
//  Created by Oscar De Moya on 2025/7/18.
//

import Foundation
import SwiftUI

public extension UIComponents {
    static func configure(sizing: Sizing, isLoggingEnabled: Bool = false) {
        Config.shared.sizing = sizing
        Config.shared.isLoggingEnabled = isLoggingEnabled
    }
}
