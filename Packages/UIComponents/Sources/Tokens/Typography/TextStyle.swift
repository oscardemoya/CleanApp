//
//  TextStyle.swift
//
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI
import Toolkit

public typealias TextStyleConfig = (fontWeight: Font.Weight, fontSize: CGFloat)

public enum TextStyle: String, Identifiable, Hashable, CaseIterable {
    case display
    case header
    case title1
    case title2
    case headline
    case subtitle
    case large
    case body
    case small
    case caption
    case overline
    
    static let fontStyles: [TextStyle: Font.TextStyle] = [
        .display: .largeTitle,
        .header: .title,
        .title1: .title2,
        .title2: .title3,
        .headline: .headline,
        .subtitle: .subheadline,
        .large: .callout,
        .body: .body,
        .small: .footnote,
        .caption: .caption,
        .overline: .caption2
    ]
    
    public var id: Self { self }
    public var source: FontSource { Config.shared.font.source }
    
    public var custom: Font {
        let fontName = Config.shared.customFontFamily.fontName(weight: weight)
        return Font.custom(fontName, size: size, relativeTo: textStyle)
    }
    
    public var uiFont: CrossPlatformFont {
        let fontName = Config.shared.customFontFamily.fontName(weight: weight)
        return CrossPlatformFont(name: fontName, size: size)!
    }
    
    public var size: CGFloat { Config.shared.font.size(for: self) }
    public var design: Font.Design { Config.shared.font.design }
    public var weight: Font.Weight { Config.shared.font.weight(for: self) }
        
    var textStyle: Font.TextStyle { Self.fontStyles[self] ?? .body }
    
    public init(_ textStyle: Font.TextStyle) {
        self = Self.fontStyles.first { $0.value == textStyle }?.key ?? .body
    }
}
