//
//  CornerStyleModifier.swift
//
//
//  Created by Oscar De Moya on 13/03/24.
//

import SwiftUI

public extension View {
    func cornerStyle(_ style: CornerStyle) -> some View {
        modifier(
            CornerStyleModifier(cornerStyle: style)
        )
    }
}

private struct CornerStyleModifier: ViewModifier {
    var cornerStyle: CornerStyle
    
    func body(content: Content) -> some View {
        switch cornerStyle {
        case .sharp:
            content
        case .rounded(let cornerRadius):
            content.clipShape(RoundedRectangle(cornerRadius: cornerRadius.value, style: .continuous))
        case .capsule:
            content.clipShape(Capsule())
        case .circle:
            content.clipShape(Circle())
        }
    }
}
