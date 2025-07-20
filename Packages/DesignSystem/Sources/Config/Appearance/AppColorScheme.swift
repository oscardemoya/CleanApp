//
//  AppColorScheme.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 11/18/24.
//

import SwiftUI

enum AppColorScheme: String, CaseIterable, Identifiable {
    case system
    case dark
    case light
    
    var id: Self { self }
    
    var name: String {
        switch self {
        case .system: String(localized: "System")
        case .dark: String(localized: "Dark")
        case .light: String(localized: "Light")
        }
    }
    
    var iconName: String {
        switch self {
        case .system: return "moon.stars" // 􀇀
        case .dark: return "moon" // 􀆹
        case .light: return "sun.max" // 􀆭
        }
    }
    
    mutating func toggle() {
        switch self {
        case .system: self = .light
        case .dark: self = .system
        case .light: self = .dark
        }
    }
}
