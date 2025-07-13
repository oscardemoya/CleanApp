//
//  FillButtonStyle.swift
//  UIComponents
//
//  Created by Oscar De Moya on 10/7/24.
//

import SwiftUI

public struct FillButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    var backgroundColor: Color
    var foregroundColor: Color
    var disabledBackgroundColor: Color
    var disabledForegroundColor: Color
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: Config.shared.button.maxWidth)
            .padding(.horizontal, .medium)
            .padding(.vertical, .small)
            .background(isEnabled ? backgroundColor : disabledBackgroundColor)
            .foregroundColor(isEnabled ? foregroundColor : disabledForegroundColor)
            .cornerStyle(Config.shared.button.cornerStyle)
            .textStyle(Config.shared.button.textStyle)
            .textCase(Config.shared.button.textCase)
            .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
            .transition(.opacity)
    }
}

public extension ButtonStyle where Self == FillButtonStyle {
    static func filled(
        backgroundColor: Color = .accentBrand,
        foregroundColor: Color = .baseWhite,
        disabledBackgroundColor: Color = .nonDecorativeElement.shade(.shade3).opacity(0.5),
        disabledForegroundColor: Color = .primaryText.shade(.shade7).opacity(0.5)
    ) -> Self {
        .init(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            disabledBackgroundColor: disabledBackgroundColor,
            disabledForegroundColor: disabledForegroundColor
        )
    }
}

#Preview {
    VStack(spacing: .large) {
        VStack {
            Button("Title") {}.buttonStyle(.filled(backgroundColor: .secondaryBrand))
        }
        VStack {
            Button("Title") {}.buttonStyle(.filled(disabledBackgroundColor: .nonDecorativeElement)).disabled(true)
        }
    }
    .padding(.small)
}
