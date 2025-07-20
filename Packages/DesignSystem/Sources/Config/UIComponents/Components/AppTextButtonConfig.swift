//
//  AppTextButtonConfig.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 9/19/24.
//

import SwiftUI
import UIComponents

struct AppTextButtonConfig: TextButtonConfig {
    static var shared: Self { .init() }
    
    // MARK: - General
    let textStyle: TextStyle = .large
    let textCase: Text.Case? = .none
}
