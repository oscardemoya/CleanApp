//
//  HSBA.swift
//  Toolkit
//
//  Created by Oscar De Moya on 12/5/24.
//

import Foundation

public struct HSBA: Codable, RawRepresentable {
    public var hue: CGFloat
    public var saturation: CGFloat
    public var brightness: CGFloat
    public var alpha: CGFloat
    
    public var rawValue: String {
        if alpha != 1.0 {
            let hueString = "H\(Int(round(hue * 255)))"
            let saturationString = "S\(Int(round(saturation * 255)))"
            let brightnessString = "B\(Int(round(brightness * 255)))"
            let alphaString = "A\(Int(round(alpha * 255)))"
            return "\(hueString) \(saturationString) \(brightnessString) \(alphaString)"
        } else {
            let hueString = "H\(Int(round(hue * 255)))"
            let saturationString = "S\(Int(round(saturation * 255)))"
            let brightnessString = "B\(Int(round(brightness * 255)))"
            return "\(hueString) \(saturationString) \(brightnessString)"
        }
    }

    public init?(rawValue: String) {
        guard let hsba = rawValue.hsba else { return nil }
        self = hsba
    }
    
    public init(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat = 1.0) {
        self.hue = hue
        self.saturation = saturation
        self.brightness = brightness
        self.alpha = alpha
    }
}
