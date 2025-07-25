//
//  ColorAdjustment.swift
//  Toolkit
//
//  Created by Oscar De Moya on 12/5/24.
//

import SwiftUI

public extension Color {
    func adjust(
        hue: CGFloat = 0,
        saturation: CGFloat = 0,
        brightness: CGFloat = 0,
        opacity: CGFloat = 1
    ) -> Color {
        let color = CrossPlatformColor(self)
        guard let hsba = color.hsba else { return self }
        let newHue = max(min(hsba.hue + hue, 1), 0)
        let newSaturation = max(min(hsba.saturation + saturation, 1), 0)
        let newBrightness = max(min(hsba.brightness + brightness, 1), 0)
        let newOpacity = max(min(hsba.alpha + opacity, 1), 0)
        return Color(hue: newHue, saturation: newSaturation, brightness: newBrightness, opacity: newOpacity)
    }
    
    func replace(
        hue: CGFloat? = nil,
        saturation: CGFloat? = nil,
        brightness: CGFloat? = nil,
        opacity: CGFloat? = nil
    ) -> Color {
        let color = CrossPlatformColor(self)
        guard let hsba = color.hsba else { return self }
        var new = hsba
        if let hue { new.hue = hue }
        if let saturation { new.saturation = saturation }
        if let brightness { new.brightness = brightness }
        if let opacity { new.alpha = opacity }
        return Color(hue: new.hue, saturation: new.saturation, brightness: new.brightness, opacity: new.alpha)
    }
    
    var muted: Color {
        self.replace(saturation: 0.5, brightness: 0.7)
    }
}
