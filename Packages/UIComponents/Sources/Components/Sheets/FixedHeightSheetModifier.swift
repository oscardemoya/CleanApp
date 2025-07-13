//
//  FixedHeightSheetModifier.swift
//  UIComponents
//
//  Created by Oscar De Moya on 18/05/24.
//

import SwiftUI

private struct FixedHeightSheetModifier<Value: View>: ViewModifier {
    @Binding var isPresented: Bool
    var backgroundColor: Color = .primaryBackground
    @ViewBuilder let sheetContent: () -> Value
    var onDismiss: (() -> Void)?
    @State private var sheetHeight: CGFloat = .zero
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented, onDismiss: onDismiss) {
                ScrollView {
                    sheetContent()
                        .onSizeChange { size in
                            sheetHeight = size.height
                        }
                        .presentationDetents([.height(sheetHeight)])
                        .presentationDragIndicator(.visible)
                }
                .background(backgroundColor)
                // TODO: .scrollBounceBehavior(.basedOnSize)
            }
    }
}

public extension View {
    func fixedHeightSheet<Content>(isPresented: Binding<Bool>,
                                   backgroundColor: Color = .primaryBackground,
                                   @ViewBuilder content: @escaping () -> Content,
                                   onDismiss: (() -> Void)? = nil) -> some View where Content : View {
        modifier(FixedHeightSheetModifier(
            isPresented: isPresented,
            backgroundColor: backgroundColor,
            sheetContent: content,
            onDismiss: onDismiss)
        )
    }
}
