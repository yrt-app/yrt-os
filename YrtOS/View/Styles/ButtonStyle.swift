//
//  ButtonStyle.swift
//  YrtOS
//
//  Created by Lorenz Simon on 23.04.24.
//

import SwiftUI

enum HoverEffect {
    case fill
    case highlight
}

struct SquareButton<Label: View>: View {
    @State private var hover = false
    
    let hoverEffect: HoverEffect
    let action: () -> Void
    let label: () -> Label
    
    init(
        hoverEffect: HoverEffect = .highlight,
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.hoverEffect = hoverEffect
        self.action = action
        self.label = label
    }
    
    var body: some View {
        Button(action: action) {
            Rectangle()
                .fill(resolveBackground())
                .aspectRatio(1, contentMode: .fit)
                .frame(height: 22)
                .overlay {
                    label().foregroundColor(resolveForeground())
                }
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                .onHover { hovering in
                    if hovering {
                        hover = true
                    } else {
                        hover = false
                    }
                }
        }.buttonStyle(.borderless)
    }
    
    private func resolveBackground() -> Color {
        hoverEffect == .fill && hover ? .gray.opacity(0.2) : .clear
    }
    
    private func resolveForeground() -> Color {
        hoverEffect == .highlight && hover ? .primary : .secondary
    }
}
