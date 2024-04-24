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
                .fill(resolveBackground(effect: hoverEffect, hover: hover))
                .aspectRatio(1, contentMode: .fit)
                .frame(height: 22)
                .overlay(label().foregroundStyle(resolveForeground(effect: hoverEffect, hover: hover)))
                .cornerRadius(5)
                .onHover { hovering in
                    if hovering {
                        hover = true
                    } else {
                        hover = false
                    }
                }
        }.buttonStyle(.borderless)
    }
}

struct SquareMenuButton<Label: View, Content: View>: View {
    let hoverEffect: HoverEffect
    let content: () -> Content
    let label: () -> Label
    
    init(
        hoverEffect: HoverEffect = .highlight,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.hoverEffect = hoverEffect
        self.content = content
        self.label = label
    }
    
    var body: some View {
        Menu(content: content, label: label)
            .buttonStyle(MenuButtonStyle(hoverEffect: hoverEffect))
    }
    
    struct MenuButtonStyle: ButtonStyle {
        @State private var hover = false
        
        let hoverEffect: HoverEffect
        
        func makeBody(configuration: Configuration) -> some View {
            Rectangle()
                .fill(resolveBackground(effect: hoverEffect, hover: hover))
                .aspectRatio(1, contentMode: .fit)
                .frame(height: 22)
                .overlay(configuration.label.foregroundStyle(resolveForeground(effect: hoverEffect, hover: hover)))
                .cornerRadius(5)
                .onHover { hovering in
                    if hovering {
                        hover = true
                    } else {
                        hover = false
                    }
                }
        }
    }
}

private func resolveBackground(effect: HoverEffect, hover: Bool) -> Color {
    effect == .fill && hover ? .secondary.opacity(0.3) : .clear
}

private func resolveForeground(effect: HoverEffect, hover: Bool) -> Color {
    effect == .highlight && hover ? .primary : .secondary
}
