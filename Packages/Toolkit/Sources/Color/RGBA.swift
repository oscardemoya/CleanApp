//
//  RGBA.swift
//  Toolkit
//
//  Created by Oscar De Moya on 12/5/24.
//

import Foundation

public struct RGBA: Codable, RawRepresentable {
    public var red: CGFloat
    public var green: CGFloat
    public var blue: CGFloat
    public var alpha: CGFloat
    
    public var rawValue: String {
        if alpha != 1.0 {
            "H\(Int(round(red * 255))) S\(Int(round(green * 255))) B\(Int(round(blue * 255))) A\(Int(round(alpha * 255)))"
        } else {
            "H\(Int(round(red * 255))) S\(Int(round(green * 255))) B\(Int(round(blue * 255)))"
        }
    }

    public init?(rawValue: String) {
        self = rawValue.rgba
    }
    
    public init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}
