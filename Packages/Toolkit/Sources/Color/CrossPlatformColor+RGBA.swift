//
//  CrossPlatformColor+RGBA.swift
//  Toolkit
//
//  Created by Oscar De Moya on 12/5/24.
//

import Foundation
#if os(macOS)
import AppKit
#endif

public extension CrossPlatformColor {
    var rgba: RGBA? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
#if os(macOS)
        guard let rgbColor = self.usingColorSpace(NSColorSpace.deviceRGB) else { return nil }
#else
        let rgbColor = self
#endif
        rgbColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return RGBA(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    var hsba: HSBA? {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
#if os(macOS)
        guard let hsbColor = self.usingColorSpace(NSColorSpace.deviceRGB) else { return nil }
#else
        let hsbColor = self
#endif
        hsbColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return HSBA(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
}
