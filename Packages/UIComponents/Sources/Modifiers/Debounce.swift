//
//  DebounceModifier.swift
//  UIComponents
//
//  Created by Oscar De Moya on 22/05/24.
//

import SwiftUI
import Combine
import Toolkit

public struct DebounceModifier<Value: Equatable>: ViewModifier {
    @Binding var value: Value
    let debounceTime: TimeInterval
    let action: ValueAction<Value>?
    
    @StateObject private var debouncePublisher = DebouncePublisher<Value>()

    public func body(content: Content) -> some View {
        content
            .onChange(of: value) { _, newValue in
                debouncePublisher.subject.send(newValue)
            }
            .onReceive(
                debouncePublisher.subject
                    .debounce(for: .seconds(debounceTime), scheduler: RunLoop.main)
            ) { debouncedValue in
                action?(debouncedValue)
            }
    }
}

private class DebouncePublisher<Value>: ObservableObject {
    let subject = PassthroughSubject<Value, Never>()
}

public extension View {
    func debounce<V: Equatable>(_ value: Binding<V>,
                                after debounceTime: TimeInterval,
                                perform action: @escaping (V) -> Void) -> some View {
        self.modifier(DebounceModifier(value: value, debounceTime: debounceTime, action: action))
    }
}
