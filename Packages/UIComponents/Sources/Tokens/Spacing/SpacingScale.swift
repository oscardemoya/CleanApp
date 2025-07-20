//
//  SpacingScale.swift
//  UIComponents
//
//  Created by Oscar De Moya on 2025/7/18.
//

import Foundation

public protocol SpacingScale {
    static var zero: CGFloat { get }
    static var quark: CGFloat { get }
    static var nano: CGFloat { get }
    static var extraSmall: CGFloat { get }
    static var small: CGFloat { get }
    static var medium: CGFloat { get }
    static var large: CGFloat { get }
    static var extraLarge: CGFloat { get }
    static var big: CGFloat { get }
    static var huge: CGFloat { get }
    static var giant: CGFloat { get }
    static var jumbo: CGFloat { get }
}
