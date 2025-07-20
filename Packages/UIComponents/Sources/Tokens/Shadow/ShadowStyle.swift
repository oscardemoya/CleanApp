//
//  ShadowStyle.swift
//
//
//  Created by Oscar De Moya on 13/03/24.
//

import SwiftUI

public enum ShadowStyle: Identifiable, Hashable, CaseIterable {
    case subtle
    case light
    case medium
    case intense

    public var id: Self { self }
    public var opacity: CGFloat { Config.shared.shadow.opacity(for: self) }
    public var radius: CGFloat { Config.shared.shadow.radius(for: self) }
    public var offset: CGPoint { Config.shared.shadow.offset(for: self) }
}
