//
//  Color+Representation.swift
//  Toolkit
//
//  Created by Oscar De Moya on 12/5/24.
//

import SwiftUI

public extension Color {
    init(hsba: HSBA) {
        self.init(
            hue: min(max(hsba.hue, 0), 1),
            saturation: min(max(hsba.saturation, 0), 1),
            brightness: min(max(hsba.brightness, 0), 1),
            opacity: min(max(hsba.alpha, 0), 1)
        )
    }
    
    var hsba: HSBA? { crossPlatform.hsba }    
}
