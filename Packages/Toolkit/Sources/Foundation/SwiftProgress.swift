//
//  SwiftProgress.swift
//  Toolkit
//
//  Created by Oscar De Moya on 11/15/24.
//

import Foundation

public struct SwiftProgress: Equatable {
    public var completedUnitCount: Int64
    public var totalUnitCount: Int64
    
    public init(completedUnitCount: Int64 = 0, totalUnitCount: Int64 = 0) {
        self.completedUnitCount = completedUnitCount
        self.totalUnitCount = totalUnitCount
    }
    
    public var fractionCompleted: Double {
        totalUnitCount > 0 ? Double(completedUnitCount) / Double(totalUnitCount) : 0.0
    }

    public var isFinished: Bool {
        completedUnitCount >= totalUnitCount
    }

    public static func == (lhs: SwiftProgress, rhs: SwiftProgress) -> Bool {
        guard lhs.completedUnitCount == rhs.completedUnitCount else { return false }
        guard lhs.totalUnitCount == rhs.totalUnitCount else { return false }
        return true
    }
}
