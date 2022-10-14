//
//  Logger.swift
//  
//
//  Created by Oscar De Moya on 9/10/22.
//

import Foundation

protocol Logger {
    func log(_ level: LogLevel, message: Any, file: String, line: Int)
    func info(_ message: Any, file: String, line: Int)
    func debug(_ message: Any, file: String, line: Int)
    func warning(_ message: Any, file: String, line: Int)
    func error(_ message: Any, file: String, line: Int)
    func fault(_ message: Any, file: String, line: Int)
}

public enum LogLevel: String {
    case info
    case debug
    case warning
    case error
    case fault
}
