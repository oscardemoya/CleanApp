//
//  File.swift
//  
//
//  Created by Oscar De Moya on 18/05/24.
//

import SwiftUI

public protocol FontConfig {
    var design: Font.Design { get }
    var source: FontSource { get }
    func size(for style: TextStyle) -> CGFloat
    func weight(for style: TextStyle) -> Font.Weight
}

struct DefaultFontConfig: FontConfig {
    var design: Font.Design { .default }
    var source: FontSource { .system }
    
    func size(for style: TextStyle) -> CGFloat {
        Self.fontSizes[style]?.fontSize ?? 16
    }
    
    func weight(for style: TextStyle) -> Font.Weight {
        Self.fontSizes[style]?.fontWeight ?? .regular
    }
    
    static let fontSizes: [TextStyle: TextStyleConfig] = [
        .display: (fontWeight: .bold, fontSize: 72),
        .header: (fontWeight: .bold, fontSize: 44),
        .title1: (fontWeight: .bold, fontSize: 36),
        .title2: (fontWeight: .bold, fontSize: 28),
        .headline: (fontWeight: .bold, fontSize: 22),
        .subtitle: (fontWeight: .bold, fontSize: 14),
        .large: (fontWeight: .regular, fontSize: 18),
        .body: (fontWeight: .regular, fontSize: 16),
        .small: (fontWeight: .regular, fontSize: 14),
        .caption: (fontWeight: .regular, fontSize: 12),
        .overline: (fontWeight: .bold, fontSize: 10)
    ]
}
