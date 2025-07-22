//
//  FontLoader.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 2025/7/20.
//

import Foundation
import CoreText

public enum FontLoader {
    public static func registerFonts(fontNames: [String]) {
        let bundle = Bundle.module
        _ = bundle.bundleURL.startAccessingSecurityScopedResource()
        for fontName in fontNames {
            guard let url = bundle.url(forResource: fontName, withExtension: nil) else {
                logger.error("Couldn't find font \(fontName)")
                continue
            }
            var error: Unmanaged<CFError>?
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error)
            if let error = error?.takeUnretainedValue() {
                logger.error("Failed to register font \(fontName): \(error)")
            }
        }
    }
}
