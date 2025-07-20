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
                    .font(.footnote)
                    .foregroundColor(.dangerFeedback)
            }
        }
    }
}

public extension View {
    func textFieldError(_ error: String?, spacing: Spacing = .extraSmall) -> some View {
        self.modifier(TextFieldErrorModifier(error: error, spacing: spacing))
    }
}

#Preview {
    @Previewable @State var text: String = ""
    VStack(spacing: .small) {
        TextField("Placeholder", text: $text)
            .textFieldStyle(.primary)
            .padding()
            .background(.primaryBackground)
        TextField("Placeholder", text: $text)
            .textFieldStyle(.secondary)
            .padding()
            .background(.secondaryBackground)
    }
}
