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

struct DateFieldStyleKey: EnvironmentKey {
    static let defaultValue = AnyDateFieldStyle(style: .automatic)
}

extension EnvironmentValues {
    var dateFieldStyle: AnyDateFieldStyle {
        get { self[DateFieldStyleKey.self] }
        set { self[DateFieldStyleKey.self] = newValue }
    }
}

public extension View {
    func dateFieldStyle<S: DateFieldStyle>(_ style: S) -> some View {
        environment(\.dateFieldStyle, AnyDateFieldStyle(style: style))
    }
}

struct AnyDateFieldStyle: DateFieldStyle {
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
