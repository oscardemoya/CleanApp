//
//  SemanticButtonStyle.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/8/24.
//

import SwiftUI

public struct SemanticButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    var feedback: Feedback = .success
    
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
    
    var backgroundColor: Color {
        switch feedback {
        case .info: .informativeFeedback
        case .success: .successFeedback
        case .warning: .warningFeedback
        case .danger: .dangerFeedback
        }
    }
    
    var foregroundColor: Color {
        switch feedback {
        case .info: .baseLight
        case .success: .baseLight
        case .warning: .baseLight
        case .danger: .baseLight
        }
    }
    
    var disabledBackgroundColor: Color {
        switch feedback {
        case .info: .primaryText.shade(.shade2).opacity(0.5)
        case .success: .primaryText.shade(.shade2).opacity(0.5)
        case .warning: .primaryText.shade(.shade2).opacity(0.5)
        case .danger: .primaryText.shade(.shade2).opacity(0.5)
        }
    }
    
    var disabledForegroundColor: Color {
        switch feedback {
        case .info: .primaryText.shade(.shade6).opacity(0.5)
        case .success: .primaryText.shade(.shade6).opacity(0.5)
        case .warning: .primaryText.shade(.shade6).opacity(0.5)
        case .danger: .primaryText.shade(.shade6).opacity(0.5)
        }
    }
}

public extension ButtonStyle where Self == SemanticButtonStyle {
    static var info: Self { .init(feedback: .info) }
    static var success: Self { .init(feedback: .success) }
    static var warning: Self { .init(feedback: .warning) }
    static var danger: Self { .init(feedback: .danger) }
}

#Preview {
    VStack(spacing: .large) {
        VStack {
            Button("Info") {}.buttonStyle(.info)
            Button("Success") {}.buttonStyle(.success)
            Button("Warning") {}.buttonStyle(.warning)
            Button("Danger") {}.buttonStyle(.danger)
        }
        VStack {
            Button("Info") {}.buttonStyle(.info).disabled(true)
            Button("Success") {}.buttonStyle(.success).disabled(true)
            Button("Warning") {}.buttonStyle(.warning).disabled(true)
            Button("Danger") {}.buttonStyle(.danger).disabled(true)
        }
    }
    .padding(.small)
}
