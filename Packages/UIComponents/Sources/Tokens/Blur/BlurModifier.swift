//
//  BlurModifier.swift
//
//
//  Created by Oscar De Moya on 14/03/24.
//

import SwiftUI

public extension View {
    func blur(_ blurIntensity: BlurIntensity) -> some View {
        modifier(
            BlurModifier(blurIntensity: blurIntensity)
        )
    }
}

private struct BlurModifier: ViewModifier {
    var blurIntensity: BlurIntensity
    
    func body(content: Content) -> some View {
        content.blur(radius: blurIntensity.radius)
    }
}
