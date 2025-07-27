//
//  UIComponents+Config.swift
//  UIComponents
//
//  Created by Oscar De Moya on 2025/7/18.
//

import Foundation
import SwiftUI

@MainActor
public extension UIComponents {
    static func configure(sizing: Sizing) {
        Config.shared.sizing = sizing
    }
}
