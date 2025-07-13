//
//  Color+Representation.swift
//  Toolkit
//
//  Created by Oscar De Moya on 12/5/24.
//

import SwiftUI

public extension Color {
    init(hex: String) {
        self.init(rgba: hex.rgba)
    }
    
    var hexRGB: String {
        guard let rgba else { return "" }
        return String(format: "#%02x%02x%02x",
                      Int(rgba.red * 255),
                      Int(rgba.green * 255),
                      Int(rgba.blue * 255))
    }
    
    var hexRGBA: String {
        guard let rgba else { return "" }
        return String(format: "#%02x%02x%02x%02x",
                      Int(rgba.red * 255),
                      Int(rgba.green * 255),
                      Int(rgba.blue * 255),
                      Int(rgba.alpha * 255))
    }
}
