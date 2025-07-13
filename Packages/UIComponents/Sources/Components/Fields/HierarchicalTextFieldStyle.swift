//
//  HierarchicalTextFieldStyle.swift
//  UIComponents
//
//  Created by Oscar De Moya on 18/05/24.
//

import SwiftUI

public struct HierarchicalTextFieldStyle: TextFieldStyle {
    var hierarchy: Hierarchy = .primary
    
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.small)
            .background(hierarchy.inputBackgroundColor)
            .foregroundStyle(hierarchy.inputForegroundColor)
            .borderStyle(
                Config.shared.textField.borderStyle,
                borderColor: Config.shared.textField.borderColor,
                cornerStyle: Config.shared.textField.cornerStyle
            )
    }
}

public extension TextFieldStyle where Self == HierarchicalTextFieldStyle {
    static var primary: HierarchicalTextFieldStyle { .init(hierarchy: .primary) }
    static var secondary: HierarchicalTextFieldStyle { .init(hierarchy: .secondary) }
}

public extension Hierarchy {
    var textFieldStyle: HierarchicalTextFieldStyle {
        switch self {
        case .primary: .primary
        case .secondary: .secondary
        }
    }
}

#Preview {
    @Previewable @State var text: String = ""
    VStack(spacing: .zero) {
        TextField(String("Placeholder"), text: $text)
            .textFieldStyle(.primary)
            .padding(.small)
            .background(.primaryBackground)
        TextField(String("Placeholder"), text: $text)
            .textFieldStyle(.secondary)
            .padding(.small)
            .background(.secondaryBackground)
    }
}
