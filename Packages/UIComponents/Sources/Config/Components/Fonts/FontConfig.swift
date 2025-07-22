//
//  File.swift
//  
//
//  Created by Oscar De Moya on 18/05/24.
//

import SwiftUI

public protocol FontConfig {
    var design: Font.Design { get }
    func font(for style: TextStyle) -> FontSource
    func size(for style: TextStyle) -> CGFloat
    func weight(for style: TextStyle) -> Font.Weight
}

struct DefaultFontConfig: FontConfig {
    var design: Font.Design { .default }
    
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
        .display: .init(font: .system, fontWeight: .bold, fontSize: 72),
        .header: .init(font: .system, fontWeight: .bold, fontSize: 44),
        .title1: .init(font: .system, fontWeight: .bold, fontSize: 36),
        .title2: .init(font: .system, fontWeight: .bold, fontSize: 28),
        .headline: .init(font: .system, fontWeight: .bold, fontSize: 22),
        .subtitle: .init(font: .system, fontWeight: .bold, fontSize: 14),
        .large: .init(font: .system, fontWeight: .regular, fontSize: 18),
        .body: .init(font: .system, fontWeight: .regular, fontSize: 16),
        .small: .init(font: .system, fontWeight: .regular, fontSize: 14),
        .caption: .init(font: .system, fontWeight: .regular, fontSize: 12),
        .overline: .init(font: .system, fontWeight: .bold, fontSize: 10)
    ]
}
