//
//  ClosedRange.swift
//  Toolkit
//
//  Created by Oscar De Moya on 10/22/24.
//

import Foundation

public extension ClosedRange where Bound: BinaryFloatingPoint {
    var median: Bound {
        return lowerBound + (upperBound - lowerBound) / 2
    }
}

public extension ClosedRange where Bound: BinaryInteger {
    var median: Double {
        return Double(lowerBound) + Double(upperBound - lowerBound) / 2
    }
}
