//
//  AppTextFieldConfig.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 9/19/24.
//

import SwiftUI
import UIComponents

struct AppTextFieldConfig: TextFieldConfig {
    static var shared: Self { .init() }
    
    // MARK: - General
    let textStyle: TextStyle = .headline
    let textCase: Text.Case? = .none
    let borderStyle: BorderStyle = .stroke(.regular)
    let borderColor: Color = .nonDecorativeElement
    let cornerStyle: CornerStyle = .rounded(.small)
}

#Preview {
    @Previewable @State var text: String = ""
    VStack(spacing: .small) {
        TextField(String("Placeholder"), text: $text)
            .textFieldStyle(.primary)
        TextField(String("Placeholder"), text: $text)
            .textFieldStyle(.secondary)
    }
    .padding(.small)
}
