//
//  TextButtonStyle.swift
//  UIComponents
//
//  Created by Oscar De Moya on 18/05/24.
//

import SwiftUI

public struct TextButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    var hierarchy: Hierarchy = .primary
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.extraSmall)
            .background(isEnabled ? backgroundColor : disabledBackgroundColor)
            .foregroundColor(isEnabled ? foregroundColor : disabledForegroundColor)
            .textStyle(Config.shared.textButton.textStyle)
            .textCase(Config.shared.textButton.textCase)
            .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
            .transition(.opacity)
    }
    
    var backgroundColor: Color { .clear }
    
    var foregroundColor: Color {
        switch hierarchy {
        case .primary: .primaryBrand
        case .secondary: .secondaryBrand
        }
    }
    
    var disabledBackgroundColor: Color { .clear }
    
    var disabledForegroundColor: Color {
        switch hierarchy {
        case .primary: .nonDecorativeElement.shade(.shade5).opacity(0.5)
        case .secondary: .nonDecorativeElement.shade(.shade4).opacity(0.5)
        }
    }
}

public extension ButtonStyle where Self == TextButtonStyle {
    static var primaryText: Self { .init(hierarchy: .primary) }
    static var secondaryText: Self { .init(hierarchy: .secondary) }
}

#Preview {
    VStack(spacing: .large) {
        VStack {
            Button("Primary") {}.buttonStyle(.primaryText)
            Button("Secondary") {}.buttonStyle(.secondaryText)
        }
        VStack {
            Button("Primary") {}.buttonStyle(.primaryText).disabled(true)
            Button("Secondary") {}.buttonStyle(.secondaryText).disabled(true)
        }
    }
    .padding(.small)
}
