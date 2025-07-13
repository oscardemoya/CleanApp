//
//  DefaultDateFieldStyle.swift
//  UIComponents
//
//  Created by Oscar De Moya on 29/05/24.
//

import SwiftUI

public struct DefaultDateFieldStyle: DateFieldStyle {
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
    static var automatic: DefaultDateFieldStyle { .init() }
}
