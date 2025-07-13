//
//  FontFamily.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/20/24.
//

import SwiftUI

public protocol FontFamily {
    var fontFamilyName: String { get }
    func fontName(weight: Font.Weight) -> String
}

public struct DefaultFontFamily: FontFamily {
    public var fontFamilyName: String { "AvenirNext" }

    public func fontName(weight: Font.Weight) -> String {
        switch weight {
        case .thin: "AvenirNext-UltraLight"
        case .light: "Avenir-Light"
        case .regular: "AvenirNext-Regular"
        case .medium: "AvenirNext-Medium"
        case .semibold: "AvenirNext-DemiBold"
        case .bold: "AvenirNext-Bold"
        case .heavy: "Avenir-Black"
        case .black: "AvenirNext-Heavy"
        default: "AvenirNext-Regular"
        }
    }
}
