//
//  ViewState.swift
//
//
//  Created by Oscar De Moya on 9/25/24.
//

import Foundation

public enum ViewState<T: Equatable>: Equatable {
    case empty
    case loading
    case content(T)
    case failure(Error)
    
    public var isLoading: Bool {
        if self == .loading { true } else { false }
    }
    
    public var isError: Bool {
        if case .failure = self { true } else { false }
    }
    
    public var content: T? {
        switch self {
        case .content(let content): content
        default: nil
        }
    }
    
    public static func == (lhs: ViewState<T>, rhs: ViewState<T>) -> Bool {
        switch (lhs, rhs) {
        case (.empty, .empty), (.loading, .loading), (.failure, .failure): true
        case (.content(let oldValue), .content(let newValue)): oldValue == newValue
        default: false
        }
    }
}
