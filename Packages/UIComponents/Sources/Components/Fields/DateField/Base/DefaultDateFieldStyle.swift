//
//  DefaultDateFieldStyle.swift
//  UIComponents
//
//  Created by Oscar De Moya on 29/05/24.
//

import SwiftUI

@MainActor
public struct DefaultDateFieldStyle: @MainActor DateFieldStyle {
    @ViewBuilder
    public func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 0) {
            configuration.label
            configuration.datePicker
        }
        .background(.primaryBackground)
        .foregroundColor(.primaryText)
        .borderStyle(.stroke(.regular), borderColor: .nonDecorativeElement, cornerStyle: .rounded(.small))
        .animation(.easeInOut(duration: 0.2), value: configuration.isExpanded)
    }
}

public extension DateFieldStyle where Self == DefaultDateFieldStyle {
    @MainActor static var automatic: DefaultDateFieldStyle { .init() }
}
