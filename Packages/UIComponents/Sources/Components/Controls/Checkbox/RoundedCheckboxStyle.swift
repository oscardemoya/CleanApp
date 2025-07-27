//
//  RoundedCheckboxStyle.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/7/24.
//

import SwiftUI

@MainActor
public struct RoundedCheckboxStyle: @MainActor CheckboxStyle {
    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        Image(systemName: configuration.isChecked ? "checkmark.circle.fill" : "circle")
            .foregroundColor(.accentBrand)
            .textStyle(.header)
            .padding(.small)
    }
}

public extension CheckboxStyle where Self == RoundedCheckboxStyle {
    static var rounded: RoundedCheckboxStyle { .init() }
}
