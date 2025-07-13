//
//  PaddingModifier.swift
//
//
//  Created by Oscar De Moya on 14/03/24.
//

import SwiftUI

public extension View {
    func padding(_ padding: Padding) -> some View {
        modifier(
            PaddingModifier(padding: padding)
        )
    }
    
    func padding(_ edges: Edge.Set = .all, _ padding: Padding) -> some View {
        modifier(
            PaddingModifier(edges: edges, padding: padding)
        )
    }
}

private struct PaddingModifier: ViewModifier {
    var edges: Edge.Set = .all
    var padding: Padding
    
    func body(content: Content) -> some View {
        content.padding(edges, padding.value)
    }
}
