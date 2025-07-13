//
//  CrossPlatformColor.swift
//  Toolkit
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI

#if os(macOS)
    import AppKit
    /// NSColor on macOS
    public typealias CrossPlatformColor = NSColor
#else
    import UIKit
    /// UIColor when not on macOS
    public typealias CrossPlatformColor = UIColor
#endif

public extension Color {
    var cgColor: CGColor { CrossPlatformColor(self).cgColor }
    var crossPlatform: CrossPlatformColor { .init(self) }
    
    static var universalPlaceholderText: Color {
#if os(macOS)
        Color(nsColor: .placeholderTextColor)
#else
        Color(uiColor: .placeholderText)
#endif
    }
}
