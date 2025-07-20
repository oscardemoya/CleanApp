//
//  SizeScaling.swift
//  UIComponents
//
//  Created by Oscar De Moya on 2025/7/19.
//

import Foundation

public protocol SizeScaling {
    var compact: CGFloat { get }
    var spacious: CGFloat { get }
}

struct DefaultSizeScaling: SizeScaling {
    let compact: CGFloat = 0.5
    let spacious: CGFloat = 2
}
