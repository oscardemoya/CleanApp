//
//  CheckboxStyle.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/7/24.
//

import SwiftUI

public protocol CheckboxStyle {
    associatedtype Body: View
    typealias Configuration = CheckboxStyleConfiguration
    
    @ViewBuilder func makeBody(configuration: Configuration) -> Body
}

public extension CheckboxStyle where Self == SquaredCheckboxStyle {
    @MainActor static var `default`: SquaredCheckboxStyle { .init() }
}

public struct CheckboxStyleConfiguration {
    @Binding var isChecked: Bool
    
    public init(isChecked: Binding<Bool>) {
        self._isChecked = isChecked
    }
}

struct CheckboxStyleKey: @MainActor EnvironmentKey {
    @MainActor static var defaultValue = AnyCheckboxStyle(style: .default)
}

extension EnvironmentValues {
    @MainActor var checkboxStyle: AnyCheckboxStyle {
        get { self[CheckboxStyleKey.self] }
        set { self[CheckboxStyleKey.self] = newValue }
    }
}

public extension View {
    func checkboxStyle<S: CheckboxStyle>(_ style: S) -> some View {
        environment(\.checkboxStyle, AnyCheckboxStyle(style: style))
    }
}

struct AnyCheckboxStyle: CheckboxStyle {
    private let _makeBody: (Configuration) -> AnyView

    public init<S: CheckboxStyle>(style: S) {
        self._makeBody = { configuration in
            AnyView(style.makeBody(configuration: configuration))
        }
    }

    public func makeBody(configuration: Configuration) -> some View {
        _makeBody(configuration)
    }
}
