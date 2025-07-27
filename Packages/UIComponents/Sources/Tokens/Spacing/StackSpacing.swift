//
//  StackSpacing.swift
//  
//
//  Created by Oscar De Moya on 14/03/24.
//

import SwiftUI

@MainActor
public extension HStack {
    init(alignment: VerticalAlignment = .center, spacing: Spacing, @ViewBuilder content: () -> Content) {
        self.init(alignment: alignment, spacing: spacing.value, content: content)
    }
}

@MainActor
public extension VStack {
    init(alignment: HorizontalAlignment = .center, spacing: Spacing, @ViewBuilder content: () -> Content) {
        self.init(alignment: alignment, spacing: spacing.value, content: content)
    }
}
