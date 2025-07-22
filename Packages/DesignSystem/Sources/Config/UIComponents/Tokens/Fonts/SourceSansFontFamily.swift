//
//  SourceSansFontFamily.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 2025/7/20.
//

import SwiftUI
import UIComponents

public extension FontFamily where Self == SourceSansFontFamily {
    static var sourceSans: Self { .shared }
}

public struct SourceSansFontFamily: FontFamily, FontResource {
    public static var shared: SourceSansFontFamily { .init() }
    
    // MARK: FontFamily

    public func fontName(weight: Font.Weight) -> String {
        FileName.fileName(for: weight).rawValue
    }
    
    // MARK: FontResource
    
    public var fileNames: [String] { FileName.allCases.map(\.fileName) }
    
    enum FileName: String, CaseIterable {
        case black = "SourceSans3-Black"
        case bold = "SourceSans3-Bold"
        case extraLight = "SourceSans3-ExtraLight"
        case light = "SourceSans3-Light"
        case medium = "SourceSans3-Medium"
        case regular = "SourceSans3-Regular"
        case semibold = "SourceSans3-Semibold"
        
        var fileName: String { "\(rawValue).ttf" }
        
        static func fileName(for weight: Font.Weight) -> FileName {
            switch weight {
            case .black: return .black
            case .bold: return .bold
            case .ultraLight: return .extraLight
            case .light: return .light
            case .medium: return .medium
            case .regular: return .regular
            case .semibold: return .semibold
            default: return .regular
            }
        }
    }
}
