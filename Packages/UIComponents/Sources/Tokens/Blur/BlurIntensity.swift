//
//  BlurIntensity.swift
//
//
//  Created by Oscar De Moya on 13/03/24.
//

import SwiftUI

public enum BlurIntensity: CGFloat, Identifiable, Hashable, CaseIterable {
    case none
    case light
    case medium
    case intense
    
    public var id: Self { self }
    public var radius: CGFloat { Config.shared.blur.radius(for: self) }
}
