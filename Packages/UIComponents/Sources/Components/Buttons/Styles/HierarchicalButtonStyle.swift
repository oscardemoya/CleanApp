//
//  HierarchicalButtonStyle.swift
//  UIComponents
//
//  Created by Oscar De Moya on 18/05/24.
//

import SwiftUI

public struct HierarchicalButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    var hierarchy: Hierarchy = .primary
    var buttonConfig: ButtonConfig { Config.shared.button }
    
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
            .transition(.scale)
    }
    
    var backgroundColor: Color { buttonConfig.backgroundColor(for: hierarchy) }
    var foregroundColor: Color { buttonConfig.foregroundColor(for: hierarchy) }
    var disabledBackgroundColor: Color { buttonConfig.disabledBackgroundColor(for: hierarchy) }
    var disabledForegroundColor: Color { buttonConfig.disabledForegroundColor(for: hierarchy) }
}

public extension ButtonStyle where Self == HierarchicalButtonStyle {
    static var primary: Self { .init(hierarchy: .primary) }
    static var secondary: Self { .init(hierarchy: .secondary) }
}

#Preview {
    VStack(spacing: .large) {
        VStack {
            Button("Primary") {}.buttonStyle(.primary)
            Button("Secondary") {}.buttonStyle(.secondary)
        }
        VStack {
            Button("Primary") {}.buttonStyle(.primary).disabled(true)
            Button("Secondary") {}.buttonStyle(.secondary).disabled(true)
        }
    }
    .padding(.small)
}
