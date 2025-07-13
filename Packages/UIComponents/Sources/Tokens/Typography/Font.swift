//
//  Font.swift
//  
//
//  Created by Oscar De Moya on 18/05/24.
//

import SwiftUI
import UIKit

public extension Font {    
    static func printAllFonts() {
        let fontFamilyNames = UIFont.familyNames
        fontFamilyNames.forEach { familyName in
            print("Font family: \(familyName)")
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            fontNames.forEach { fontName in
                print("\tFont name: \(fontName)")
            }
        }
    }
}
