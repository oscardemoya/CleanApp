//
//  SemanticTextButtonStyle.swift
//  UIComponents
//
//  Created by Oscar De Moya on 11/12/24.
//

import SwiftUI

public struct SemanticTextButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    var feedback: Feedback = .success
    
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
        switch feedback {
        case .info: .informativeFeedback
        case .success: .successFeedback
        case .warning: .warningFeedback
        case .danger: .dangerFeedback
        }
    }
    
    var disabledBackgroundColor: Color { .clear }
    
    var disabledForegroundColor: Color {
        switch feedback {
        case .info: .primaryText.shade(.shade2).opacity(0.5)
        case .success: .primaryText.shade(.shade2).opacity(0.5)
        case .warning: .primaryText.shade(.shade2).opacity(0.5)
        case .danger: .primaryText.shade(.shade2).opacity(0.5)
        }
    }
}

public extension ButtonStyle where Self == SemanticTextButtonStyle {
    static var infoText: Self { .init(feedback: .info) }
    static var successText: Self { .init(feedback: .success) }
    static var warningText: Self { .init(feedback: .warning) }
    static var dangerText: Self { .init(feedback: .danger) }
}

#Preview {
    VStack(spacing: .large) {
        VStack {
            Button("Info") {}.buttonStyle(.infoText)
            Button("Success") {}.buttonStyle(.successText)
            Button("Warning") {}.buttonStyle(.warningText)
            Button("Danger") {}.buttonStyle(.dangerText)
        }
        VStack {
            Button("Info") {}.buttonStyle(.infoText).disabled(true)
            Button("Success") {}.buttonStyle(.successText).disabled(true)
            Button("Warning") {}.buttonStyle(.warningText).disabled(true)
            Button("Danger") {}.buttonStyle(.dangerText).disabled(true)
        }
    }
    .padding(.small)
}
