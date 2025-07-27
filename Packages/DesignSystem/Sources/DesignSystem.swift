// The Swift Programming Language
// https://docs.swift.org/swift-book

import Toolkit
import UIComponents

@MainActor
public struct DesignSystem {
    public static func configure() {
        UIComponents.configure()
        Appearance.configure()
    }
}
