//
//  Checkbox.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/7/24.
//

import SwiftUI

public struct Checkbox: View {
    @Environment(\.checkboxStyle) var style
    @Binding var isChecked: Bool
    
    public init(isChecked: Binding<Bool>) {
        self._isChecked = isChecked
    }
    
    public var body: some View {
        style.makeBody(
            configuration: CheckboxStyleConfiguration(
                isChecked: $isChecked
            )
        )
        .onTapGesture {
            isChecked.toggle()
        }
    }
}

#Preview {
    @Previewable @State var isChecked: Bool = false
    Checkbox(isChecked: $isChecked)
}
