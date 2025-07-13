//
//  CardGroupBoxStyle.swift
//  UIComponents
//
//  Created by Oscar De Moya on 18/05/24.
//

import SwiftUI

public struct CardGroupBoxStyle: GroupBoxStyle {
    public func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.secondaryBackground)
        .borderStyle(.stroke(.regular), borderColor: .nonDecorativeElement, cornerStyle: .rounded(.medium))
    }
}

public extension GroupBoxStyle where Self == CardGroupBoxStyle {
    static var card: CardGroupBoxStyle { .init() }
}
