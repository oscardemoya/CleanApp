//
//  GothamFontFamily.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 2025/7/20.
//

import SwiftUI
import UIComponents

public extension FontFamily where Self == GothamFontFamily {
    static var gotham: Self { .shared }
}

public struct GothamFontFamily: FontFamily, FontResource {
    public static var shared: GothamFontFamily { .init() }
    
    // MARK: FontFamily

    public func fontName(weight: Font.Weight) -> String {
        FileName.fileName(for: weight).rawValue
    }
    
    // MARK: FontResource
    
    public var fileNames: [String] { FileName.allCases.map(\.fileName) }
    
    enum FileName: String, CaseIterable {
        case black = "Gotham-Black"
        case bold = "Gotham-Bold"
        case book = "Gotham-Book"
        case light = "Gotham-Light"
        case medium = "Gotham-Medium"
        
        var fileName: String { "\(rawValue).ttf" }
        
        static func fileName(for weight: Font.Weight) -> FileName {
            switch weight {
            case .black: .black
            case .bold: .bold
            case .regular: .book
            case .light: .light
            case .medium: .medium
            default: .book
            }
        }
    }
}
