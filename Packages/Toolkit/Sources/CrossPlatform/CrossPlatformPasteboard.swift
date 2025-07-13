//
//  CrossPlatformPasteboard.swift
//  
//
//  Created by Oscar De Moya on 19/05/24.
//

#if canImport(UIKit)
import UIKit
#endif
#if canImport(AppKit)
import AppKit
#endif

public extension String {
    static var pasteboardString: String? {
#if os(macOS)
        NSPasteboard.general.string(forType: .string)
#else
        UIPasteboard.general.string
#endif
    }
}
