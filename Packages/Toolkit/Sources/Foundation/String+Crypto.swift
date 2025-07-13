//
//  String+Crypto.swift
//  Toolkit
//
//  Created by Oscar De Moya on 11/24/24.
//

import Foundation
import CryptoKit

public extension String {
    var sha256: String {
        let inputData = Data(utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap { String(format: "%02x", $0) }.joined()
        return hashString
    }
    
    static func nonce(length: UInt = 32) -> String {
        let charset: [Character] = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        return (0..<length).compactMap { _ in charset.randomElement() }.reduce("", { $0 + String($1) })
    }
}
