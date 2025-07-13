//
//  TextFieldConfig.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/19/24.
//

import SwiftUI

public protocol TextFieldConfig {
    // MARK: - General
    var textStyle: TextStyle { get }
    var textCase: Text.Case? { get }
    var borderStyle: BorderStyle { get }
    var borderColor: Color { get }
    var cornerStyle: CornerStyle { get }
}

struct DefaultTextFieldConfig: TextFieldConfig {
    // MARK: - General
    let textStyle: TextStyle = .headline
    let textCase: Text.Case? = .none
    let borderStyle: BorderStyle = .stroke(.regular)
    let borderColor: Color = Color(.nonDecorativeElement)
    let cornerStyle: CornerStyle = .rounded(.small)
}
