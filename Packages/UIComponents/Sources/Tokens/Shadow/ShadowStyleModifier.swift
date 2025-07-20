//
//  ShadowStyleModifier.swift
//
//
//  Created by Oscar De Moya on 13/03/24.
//

import SwiftUI

private struct ShadowStyleModifier: ViewModifier {
    var shadowStyle: ShadowStyle
    var shadowColor: Color
    
    func body(content: Content) -> some View {
        content.shadow(color: shadowColor.opacity(shadowStyle.opacity),
                       radius: shadowStyle.radius,
                       x: shadowStyle.offset.x,
                       y: shadowStyle.offset.y)
    }
}

public extension View {
    func shadowStyle(_ style: ShadowStyle, color: Color = Color.baseDark) -> some View {
        modifier(
            ShadowStyleModifier(
                shadowStyle: style,
                shadowColor: color
            )
        )
    }
}
