//
//  ColorBlending.swift
//  
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI
import Toolkit

public extension Color {
    private struct ColorComponents {
        let red: CGFloat
        let green: CGFloat
        let blue: CGFloat
        let alpha: CGFloat

        init?(cgColorComponents components: [CGFloat]) {
            guard components.count >= 4 else { return nil }
            self.red = components[0]
            self.green = components[1]
            self.blue = components[2]
            self.alpha = components[3]
        }
        
        init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
            self.red = red
            self.green = green
            self.blue = blue
            self.alpha = alpha
        }

        func blended(with other: ColorComponents, weight selfWeight: CGFloat, otherWeight: CGFloat) -> ColorComponents {
            return ColorComponents(
                red: selfWeight * red + otherWeight * other.red,
                green: selfWeight * green + otherWeight * other.green,
                blue: selfWeight * blue + otherWeight * other.blue,
                alpha: selfWeight * alpha + otherWeight * other.alpha
            )
        }
    }

    static func blend(color1: Color, intensity1: CGFloat = 0.5,
                      color2: Color, intensity2: CGFloat = 0.5) -> Color {
        let total = intensity1 + intensity2
        let normalizedIntensity1 = intensity1 / total
        let normalizedIntensity2 = intensity2 / total

        guard normalizedIntensity1 > 0 else { return color2 }
        guard normalizedIntensity2 > 0 else { return color1 }
        guard let components1 = color1.cgColor.components.flatMap(ColorComponents.init) else { return color2 }
        guard let components2 = color2.cgColor.components.flatMap(ColorComponents.init) else { return color1 }

        let blended = components1.blended(
            with: components2,
            weight: normalizedIntensity1,
            otherWeight: normalizedIntensity2
        )

        return Color(.displayP3, red: blended.red, green: blended.green, blue: blended.blue, opacity: blended.alpha)
    }
}
