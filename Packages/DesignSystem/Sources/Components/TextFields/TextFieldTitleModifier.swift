//
//  TextFieldTitleModifier.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 2025/7/18.
//

import SwiftUI
import UIComponents

struct TextFieldTitleModifier: ViewModifier {
    let titleKey: LocalizedStringKey?
    let spacing: Spacing

    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: spacing) {
            if let titleKey {
                Text(titleKey)
                    .textStyle(.small)
                    .foregroundColor(.primaryText)
            }
            content
        }
    }
}

public extension View {
    func textFieldTitle(_ titleKey: LocalizedStringKey?, spacing: Spacing = .nano) -> some View {
        self.modifier(TextFieldTitleModifier(titleKey: titleKey, spacing: spacing))
    }
}

#Preview {
    @Previewable @State var text: String = ""
    TextField("Placeholder", text: $text)
        .textFieldTitle("Title", spacing: .extraSmall)
        .padding()
}
