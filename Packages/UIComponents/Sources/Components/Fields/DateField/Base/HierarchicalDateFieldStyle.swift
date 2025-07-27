//
//  HierarchicalDateFieldStyle.swift
//  UIComponents
//
//  Created by Oscar De Moya on 29/05/24.
//

import SwiftUI

@MainActor
public struct HierarchicalDateFieldStyle: @MainActor DateFieldStyle {
    var hierarchy: Hierarchy = .primary
    
    public func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 0) {
            configuration.label
            configuration.datePicker
        }
        .background(hierarchy.inputBackgroundColor)
        .foregroundStyle(hierarchy.inputForegroundColor)
        .borderStyle(.stroke(.regular), borderColor: .nonDecorativeElement, cornerStyle: .rounded(.small))
        .animation(.easeInOut(duration: 0.2), value: configuration.isExpanded)
    }
}

@MainActor
public extension DateFieldStyle where Self == HierarchicalDateFieldStyle {
    static func hierarchical(_ hierarchy: Hierarchy) -> Self { .init(hierarchy: hierarchy) }
    static var primary: Self { .init(hierarchy: .primary) }
    static var secondary: Self { .init(hierarchy: .secondary) }
}
