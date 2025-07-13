//
//  VariableSizeCircularStyle.swift
//  UIComponents
//
//  Created by Oscar De Moya on 11/15/24.
//

import SwiftUI

public struct VariableSizeCircularStyle: GaugeStyle {
    public func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .stroke(.primary.opacity(0.5), lineWidth: 4)
            Circle()
                .trim(to: configuration.value)
                .stroke(.primary, style: .init(lineWidth: 4, lineCap: .round))
                .rotationEffect(.degrees(-90))
            configuration.currentValueLabel
        }
    }
}

extension GaugeStyle where Self == VariableSizeCircularStyle {
    public static var variableSizeCircular: VariableSizeCircularStyle { .init() }
}
