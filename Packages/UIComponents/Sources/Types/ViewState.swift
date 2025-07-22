//
//  ViewState.swift
//
//
//  Created by Oscar De Moya on 9/25/24.
//

import SwiftUI

public enum ViewState<T: Equatable>: Equatable {
    case initial
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
    
    public var hasContent: Bool {
        if case .content = self { true } else { false }
    }
    
    public var error: Error? {
        switch self {
        case .failure(let error): error
        default: nil
        }
    }
    
    public var errorMessage: String? {
        error?.localizedDescription
    }
    
    public var isActive: Bool {
        switch self {
        case .loading, .content: true
        default: false
        }
    }
    
    public var canDisplayContent: Bool {
        switch self {
        case .initial, .content: true
        default: false
        }
    }
    
    public static func == (lhs: ViewState<T>, rhs: ViewState<T>) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial), (.empty, .empty), (.loading, .loading), (.failure, .failure): true
        case (.content(let oldValue), .content(let newValue)): oldValue == newValue
        default: false
        }
    }
}
