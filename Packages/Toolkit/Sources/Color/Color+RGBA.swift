//
//  Color+Representation.swift
//  Toolkit
//
//  Created by Oscar De Moya on 12/5/24.
//

import SwiftUI

public extension Color {
    init(rgba: RGBA) {
        self.init(.sRGB,
                  red: min(max(rgba.red, 0), 1),
                  green: min(max(rgba.green, 0), 1),
                  blue: min(max(rgba.blue, 0), 1),
                  opacity: min(max(rgba.alpha, 0), 1)
        )
    }
    
    var rgba: RGBA? { crossPlatform.rgba }
}
