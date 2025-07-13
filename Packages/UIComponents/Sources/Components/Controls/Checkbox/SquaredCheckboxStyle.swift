//
//  SquaredCheckboxStyle.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/7/24.
//

import SwiftUI

public struct SquaredCheckboxStyle: CheckboxStyle {
    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        Image(systemName: configuration.isChecked ? "checkmark.square.fill" : "square")
            .foregroundColor(.accentBrand)
            .textStyle(.header)
            .padding(.small)
    }
}

public extension CheckboxStyle where Self == SquaredCheckboxStyle {
    static var squared: SquaredCheckboxStyle { .init() }
}
