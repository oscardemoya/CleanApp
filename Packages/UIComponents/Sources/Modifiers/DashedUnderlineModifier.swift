//
//  DashedUnderlineModifier.swift
//  UIComponents
//
//  Created by Oscar De Moya on 6/07/24.
//

import SwiftUI

public extension View {
    func dashedUnderline(borderWidth: BorderWidth = .regular,
                         borderColor: Color = .nonDecorativeElement,
                         dash: [CGFloat] = [Spacing.nano.value, Spacing.quark.value]) -> some View {
        modifier(
            DashedUnderlineModifier(
                borderWidth: borderWidth,
                borderColor: borderColor,
                dash: dash
            )
        )
    }
}

private struct DashedUnderlineModifier: ViewModifier {
    var borderWidth: BorderWidth
    var borderColor: Color
    var dash: [CGFloat]
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: geometry.size.height))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
                    }
                    .stroke(style: StrokeStyle(lineWidth: borderWidth.rawValue, dash: dash))
                    .foregroundColor(borderColor)
                }
            )
    }
}
