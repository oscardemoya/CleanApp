//
//  ColorBlending.swift
//  
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI
import Toolkit

public extension Color {
    static func blend(color1: Color, intensity1: CGFloat = 0.5, color2: Color, intensity2: CGFloat = 0.5) -> Color {
        let total = intensity1 + intensity2
        
        let normalisedIntensity1 = intensity1 / total
        let normalisedIntensity2 = intensity2 / total
        
        guard normalisedIntensity1 > 0 else { return color2 }
        guard normalisedIntensity2 > 0 else { return color1 }
        
        guard let color1Components = color1.cgColor.components else { return color2 }
        guard let color2Components = color2.cgColor.components else { return color1 }
        
        let (r1, g1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = 
            (color1Components[0], color1Components[1], color1Components[2], color1Components[3])
        let (r2, g2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = 
            (color2Components[0], color2Components[1], color2Components[2], color2Components[3])

        return Color(.displayP3,
                     red: normalisedIntensity1 * r1 + normalisedIntensity2 * r2,
                     green: normalisedIntensity1 * g1 + normalisedIntensity2 * g2,
                     blue: normalisedIntensity1 * b1 + normalisedIntensity2 * b2,
                     opacity: normalisedIntensity1 * a1 + normalisedIntensity2 * a2)
    }
}
