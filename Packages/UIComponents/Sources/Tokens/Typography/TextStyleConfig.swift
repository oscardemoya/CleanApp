//
//  TextStyleConfig.swift
//  UIComponents
//
//  Created by Oscar De Moya on 2025/7/20.
//

import Foundation
import SwiftUI

public struct TextStyleConfig: Sendable {
    public let font: FontSource
    public let fontWeight: Font.Weight
    public let fontSize: CGFloat
    public let textCase: Text.Case? = nil
    
    public init(font: FontSource, fontWeight: Font.Weight, fontSize: CGFloat) {
        self.font = font
        self.fontWeight = fontWeight
        self.fontSize = fontSize
    }
}
