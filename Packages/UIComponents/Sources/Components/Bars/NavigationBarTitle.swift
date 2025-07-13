//
//  ShadowStyleModifier.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/20/24.
//

import SwiftUI

public extension View {
    func principalTitle(_ titleKey: LocalizedStringKey, hierarchy: Hierarchy = .primary) -> some View {
        modifier(
            NavigationTitleModifier(
                titleKey: titleKey,
                hierarchy: hierarchy
            )
        )
    }
}

private struct NavigationTitleModifier: ViewModifier {
    var titleKey: LocalizedStringKey
    var hierarchy: Hierarchy = .primary
    
    func body(content: Content) -> some View {
        Group {
            if #available(iOS 17.0, *) {
                content
                    .toolbarTitleDisplayMode(.inline)
            } else {
                content
            }
        }
        .toolbarBackground(.clear, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(titleKey)
                    .textStyle(.large)
                    .foregroundStyle(Config.shared.navigationBar.titleColor(hierarchy))
            }
        }
    }
}
