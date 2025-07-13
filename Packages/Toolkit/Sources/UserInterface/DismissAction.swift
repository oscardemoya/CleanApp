//
//  DismissAction.swift
//  Toolkit
//
//  Created by Oscar De Moya on 10/10/24.
//

import SwiftUI

public struct DismissActionKey: EnvironmentKey {
    public static let defaultValue: Action? = nil
}

public extension EnvironmentValues {
    var dismissAction: Action? {
        get { self[DismissActionKey.self] }
        set { self[DismissActionKey.self] = newValue }
    }
}
