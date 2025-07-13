//
//  OptionalDate.swift
//  
//
//  Created by Oscar De Moya on 18/05/24.
//

import Foundation

public enum OptionalDate: Equatable, CustomDebugStringConvertible {
    case none
    case some(Date)
    
    public var value: Date? {
        switch self {
        case .none: return nil
        case .some(let date): return date
        }
    }
    
    public var debugDescription: String {
        switch self {
        case .none: return "nil"
        case .some(let date): return date.formatted(date: .abbreviated, time: .omitted)
        }
    }
    
    public init(_ date: Date?) {
        switch date {
        case .some(let date):
            self = .some(date)
        case .none:
            self = .none
        }
    }
    
    public static func == (lhs: OptionalDate, rhs: OptionalDate) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none): return true
        case (.some(let leftDate), .some(let rightDate)): return leftDate == rightDate
        default: return false
        }
    }
}
