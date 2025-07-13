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
        case .shade1: Color(.baseWhite)
        case .shade2: Color(.baseWhite)
        case .shade3: Color(.baseWhite)
        case .shade4: nil
        case .shade5: Color(.baseBlack)
        case .shade6: Color(.baseBlack)
        case .shade7: Color(.baseBlack)
        }
    }
    
    // TODO: Move values to a Config file
    var blendIntensity: CGFloat {
        switch self {
        case .shade1: 0.9
        case .shade2: 0.6
        case .shade3: 0.2
        case .shade4: 0
        case .shade5: 0.2
        case .shade6: 0.6
        case .shade7: 0.9
        }
    }
}

public extension Color {
    func shade(_ shade: ColorShade) -> Color {
        guard let blendColor = shade.blendColor else {
            return self
        }
        return Color.blend(color1: self, intensity1: 1.0 - shade.blendIntensity,
                           color2: blendColor, intensity2: shade.blendIntensity)
    }
}
