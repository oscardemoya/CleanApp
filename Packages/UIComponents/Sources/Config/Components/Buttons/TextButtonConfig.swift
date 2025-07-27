//
//  TextButtonConfig.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/19/24.
//

import SwiftUI

public protocol TextButtonConfig: Sendable {
    // MARK: - General
    var textStyle: TextStyle { get }
    var textCase: Text.Case? { get }
}

struct DefaultTextButtonConfig: TextButtonConfig {
    // MARK: - General
    let textStyle: TextStyle = .large
    var textCase: Text.Case? = .none
}
