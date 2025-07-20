//
//  ColorShade.swift
//
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI

public enum ColorShade: CaseIterable, Identifiable {
    case shade1
    case shade2
    case shade3
    case shade4
    case shade5
    case shade6
    case shade7
    
    public var id: Self { self }
    
    var blendColor: Color? {
        switch self {
        case .shade1: Color(.baseLight)
        case .shade2: Color(.baseLight)
        case .shade3: Color(.baseLight)
        case .shade4: nil
        case .shade5: Color(.baseDark)
        case .shade6: Color(.baseDark)
        case .shade7: Color(.baseDark)
        }
    }
    
    var blendIntensity: CGFloat { Config.shared.colorShade.blendIntensity(shade: self) }
}

public extension Color {
    func shade(_ shade: ColorShade) -> Color {
        guard let blendColor = shade.blendColor else { return self }
        return Color.blend(
            color1: self, intensity1: 1.0 - shade.blendIntensity,
            color2: blendColor, intensity2: shade.blendIntensity
        )
    }
}
