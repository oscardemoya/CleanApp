//
//  DateFieldStyle.swift
//  UIComponents
//
//  Created by Oscar De Moya on 29/05/24.
//

import SwiftUI

public protocol DateFieldStyle {
    associatedtype Body: View
    typealias Configuration = DateFieldStyleConfiguration
    
    @ViewBuilder func makeBody(configuration: Configuration) -> Body
}

public struct DateFieldStyleConfiguration {
    var label: AnyView
    var datePicker: AnyView
    @Binding var isExpanded: Bool
    
    public init(label: AnyView, datePicker: AnyView, isExpanded: Binding<Bool>) {
        self.label = label
        self.datePicker = datePicker
        self._isExpanded = isExpanded
    }
}

struct DateFieldKey: @MainActor EnvironmentKey {
    @MainActor static var defaultValue = AnyDateFieldStyle(style: .automatic)
}

extension EnvironmentValues {
    @MainActor var dateFieldStyle: AnyDateFieldStyle {
        get { self[DateFieldKey.self] }
        set { self[DateFieldKey.self] = newValue }
    }
}

public extension View {
    func dateFieldStyle<S: DateFieldStyle>(_ style: S) -> some View {
        environment(\.dateFieldStyle, AnyDateFieldStyle(style: style))
    }
}

@MainActor
struct AnyDateFieldStyle: @MainActor DateFieldStyle {
    private var _makeBody: (Configuration) -> AnyView
    
    init<S: DateFieldStyle>(style: S) {
        _makeBody = { configuration in
            AnyView(style.makeBody(configuration: configuration))
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        _makeBody(configuration)
    }
}
