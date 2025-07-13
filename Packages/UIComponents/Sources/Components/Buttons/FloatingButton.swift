//
//  FloatingButton.swift
//  UIComponents
//
//  Created by Oscar De Moya on 18/05/24.
//

import SwiftUI
import Toolkit

public struct FloatingButton: View {
    @Binding public var isOn: Bool
    public var icon: Image
    public var action: Action
    
    public init(isOn: Binding<Bool>, icon: Image = Image(systemName: "plus"), action: @escaping Action) {
        self._isOn = isOn
        self.icon = icon
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            icon
                .font(.system(size: 24))
                .rotationEffect(.degrees(isOn ? 45 : 0))
                .animation(.easeOut, value: isOn)
                .padding(8)
        }
        .tint(.primaryBrand)
        .foregroundColor(.primaryText)
        .buttonStyle(.borderedProminent)
        .clipShape(.circle)
        .frame(width: 40, height: 40)
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .shadowStyle(.medium)
    }
}

#Preview {
    @Previewable @State var isAdding: Bool = false
    FloatingButton(isOn: $isAdding) { isAdding.toggle() }
}
