//
//  ClearButton.swift
//  UIComponents
//
//  Created by Oscar De Moya on 21/05/24.
//

import SwiftUI

public struct ClearButton: ViewModifier {
    @Binding var text: String
    @State private var buttonWidth: CGFloat = 0
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            if !text.isEmpty {
                CircularCloseButton {
                    text = ""
                }
                .onSizeChange { size in
                    buttonWidth = size.width
                }
            }
        }
    }
}

public extension View {
    func clearButton(text: Binding<String>) -> some View {
        modifier(ClearButton(text: text))
    }
}
