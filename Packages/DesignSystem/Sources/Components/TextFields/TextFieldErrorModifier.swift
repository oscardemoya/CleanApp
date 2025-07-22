//
//  TextFieldError.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 2025/7/18.
//

import SwiftUI
import UIComponents

struct TextFieldErrorModifier: ViewModifier {
    let error: String?
    let spacing: Spacing

    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: spacing) {
            content
            if let error, !error.isEmpty {
                Text(error)
                    .textStyle(.caption)
                    .foregroundColor(.dangerFeedback)
            }
        }
    }
}

public extension View {
    func textFieldError(_ error: String?, spacing: Spacing = .nano) -> some View {
        self.modifier(TextFieldErrorModifier(error: error, spacing: spacing))
    }
}

#Preview {
    @Previewable @State var text: String = ""
    TextField("Placeholder", text: $text)
        .textFieldError("This is an error message", spacing: .extraSmall)
        .padding()
}
