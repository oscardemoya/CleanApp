//
//  BorderWidthConfig.swift
//  UIComponents
//
//  Created by Oscar De Moya on 2025/7/18.
//

import Foundation
import UIKit

public protocol BorderWidthConfig: Sendable {
    func value(for borderWidth: BorderWidth) -> CGFloat
}

@MainActor
struct DefaultBorderWidthConfig: @MainActor BorderWidthConfig {
    func value(for borderWidth: BorderWidth) -> CGFloat {
        switch borderWidth {
        case .quark: 1 / 3
        case .regular: 1
        case .medium: 2
        case .large: 4
        case .extraLarge: 8
        }
    }
}
