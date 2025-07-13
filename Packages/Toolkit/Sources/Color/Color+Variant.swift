//
//  Color+Representation.swift
//  Toolkit
//
//  Created by Oscar De Moya on 12/5/24.
//

import SwiftUI

public extension Color {
    var luminance: Double {
        guard let color = rgba else { return 0 }
        return 0.2126 * Double(color.red) + 0.7152 * Double(color.green) + 0.0722 * Double(color.blue)
    }
    
    var isLight: Bool { luminance > 0.4 }
    
    var contrastingColor: Color {
        return adjust(saturation: isLight ? 0.1 : -0.1, brightness: isLight ? -0.3 : 0.3)
    }
}
