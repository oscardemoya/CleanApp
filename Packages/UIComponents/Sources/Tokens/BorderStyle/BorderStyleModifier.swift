//
//  BorderStyleModifier.swift
//
//
//  Created by Oscar De Moya on 13/03/24.
//

import SwiftUI

public extension View {
    func borderStyle(_ borderStyle: BorderStyle = .stroke(.regular),
                     borderColor: Color = .nonDecorativeElement,
                     cornerStyle: CornerStyle = .sharp) -> some View {
        modifier(
            BorderStyleModifier(
                borderStyle: borderStyle,
                borderColor: borderColor,
                cornerStyle: cornerStyle
            )
        )
    }
}

private struct BorderStyleModifier: ViewModifier {
    var borderStyle: BorderStyle
    var borderColor: Color
    var cornerStyle: CornerStyle
    
    func body(content: Content) -> some View {
        switch borderStyle {
        case .none:
            content
                .cornerStyle(cornerStyle)
        case .stroke(let borderWidth):
            content
                .cornerStyle(cornerStyle)
                .overlay(
                    AnyView(cornerStyle
                        .shapeStyle(borderWidth: borderWidth.value, borderColor: borderColor)
                    )
                )
        }
    }
}
