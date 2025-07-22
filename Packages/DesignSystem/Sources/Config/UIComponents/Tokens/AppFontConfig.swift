//
//  AppFontConfig.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 9/20/24.
//

import SwiftUI
import UIComponents

struct AppFontConfig: FontConfig {
    static var shared: Self { .init() }
    
    var design: Font.Design { .rounded }
    
    func font(for style: TextStyle) -> FontSource {
        Self.fontStyles[style]?.font ?? .system
    }
    
    func size(for style: TextStyle) -> CGFloat {
        Self.fontStyles[style]?.fontSize ?? 16
    }
    
    func weight(for style: TextStyle) -> Font.Weight {
        Self.fontStyles[style]?.fontWeight ?? .regular
    }
    
    static let fontStyles: [TextStyle: TextStyleConfig] = [
        .display: .init(font: .custom(.sourceSans), fontWeight: .bold, fontSize: 72),
        .header: .init(font: .custom(.sourceSans), fontWeight: .bold, fontSize: 44),
        .title1: .init(font: .custom(.sourceSans), fontWeight: .bold, fontSize: 36),
        .title2: .init(font: .custom(.sourceSans), fontWeight: .bold, fontSize: 28),
        .headline: .init(font: .custom(.sourceSans), fontWeight: .medium, fontSize: 22),
        .large: .init(font: .custom(.sourceSans), fontWeight: .regular, fontSize: 18),
        .body: .init(font: .custom(.sourceSans), fontWeight: .regular, fontSize: 16),
        .subtitle: .init(font: .custom(.sourceSans), fontWeight: .bold, fontSize: 14),
        .small: .init(font: .custom(.sourceSans), fontWeight: .semibold, fontSize: 14),
        .caption: .init(font: .custom(.sourceSans), fontWeight: .regular, fontSize: 12),
        .overline: .init(font: .custom(.sourceSans), fontWeight: .bold, fontSize: 10)
    ]
}
