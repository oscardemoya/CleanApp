//
//  FontFamily.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/20/24.
//

import SwiftUI

public protocol FontFamily {
    func fontName(weight: Font.Weight) -> String
}

public struct DefaultFontFamily: FontFamily {    
    public func fontName(weight: Font.Weight) -> String {
        switch weight {
        case .thin: "AvenirNext-UltraLight"
        case .regular: "AvenirNext-Regular"
        case .medium: "AvenirNext-Medium"
        case .semibold: "AvenirNext-DemiBold"
        case .bold: "AvenirNext-Bold"
        case .heavy: "AvenirNext-Heavy"
        default: "AvenirNext-Regular"
        }
    }
}
