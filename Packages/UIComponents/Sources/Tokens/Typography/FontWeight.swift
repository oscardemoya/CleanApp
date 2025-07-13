//
//  FontFamily.swift
//
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI

public enum FontWeight: String {
    case thin
    case light
    case regular
    case medium
    case semibold
    case bold
    case heavy
    case black
    
    private static func fontWeight(for weight: Font.Weight) -> FontWeight {
        switch weight {
        case .thin: .thin
        case .light: .light
        case .regular: .regular
        case .medium: .medium
        case .semibold: .semibold
        case .bold: .bold
        case .heavy: .heavy
        case .black: .black
        default: .regular
        }
    }
}
