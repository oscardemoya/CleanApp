//
//  FontStyleModifier.swift
//
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI

public extension View {
    func textStyle(_ style: TextStyle) -> some View {
        modifier(
            FontModifier(
                style: style,
                weight: style.weight
            )
        )
    }
}

private struct FontModifier: ViewModifier {
    var style: TextStyle
    var weight: Font.Weight?
    
    func body(content: Content) -> some View {
        switch style.source {
        case .system:
            content
                .font(
                    .system(
                        size: UIFontMetrics.default.scaledValue(for: style.size),
                        weight: weight,
                        design: style.design
                    )
                )
        case .custom:
            content
                .font(
                    .custom(
                        Config.shared.customFontFamily.fontName(weight: weight ?? style.weight),
                        size: style.size,
                        relativeTo: style.textStyle
                    )
                )
        }
    }
}
