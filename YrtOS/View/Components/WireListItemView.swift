//
//  WireListItem.swift
//  YrtOS
//
//  Created by Lorenz Simon on 28.04.24.
//

import SwiftUI

struct WireListItemView: View {
    @State var showControls = false
    
    let wireSummary: WireSummary
    
    var body: some View {
        HStack {
            avatar
            content
            Spacer()
            if showControls {
                controls
            }
            link
        }
        .background {
            if showControls {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.secondary.opacity(0.2))
                    .containerRelativeFrame(.horizontal) { lenth, axis in
                        lenth - 10
                    }
            }
        }
        .onHover { hovering in
            if hovering {
                showControls = true
            } else {
                showControls = false
            }
        }
    }
    
    var avatar: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(.secondary.opacity(0.2))
            .strokeBorder(.secondary.opacity(0.3))
            .aspectRatio(1, contentMode: .fit)
            .frame(height: 35)
            .padding(.vertical, 5)
            .overlay {
                Text(String(wireSummary.emoji)).font(.title)
            }
    }
    
    var content: some View {
        VStack(alignment: .leading) {
            Text(wireSummary.description)
                .lineLimit(1)
            
            let onlineInfo = if wireSummary.onlineCount > 0 {
                Text("\(String(wireSummary.onlineCount)) online")
                    .foregroundStyle(.green)
            } else {
                Text("offline")
                    .foregroundStyle(.secondary)
            }
            onlineInfo
                .font(.caption)
                .fontWeight(.medium)
        }
    }
    
    @ViewBuilder
    var controls: some View {
        CircleButton {
            //
        } label: {
            Image(systemName: "speaker.wave.2.fill")
        }
        CircleButton {
            //
        } label: {
            Image(systemName: "mic.fill")
        }
    }
    
    var link: some View {
        CircleButton(hoverEffect: .fill) {
            //
        } label: {
            Image(systemName: "chevron.right")
        }
    }
}

#Preview {
    let wireSummary = WireSummary(
        id: UUID().uuidString,
        emoji: "🤙",
        description: "Team X Hangout",
        onlineCount: 4
    )
    
    return WireListItemView(wireSummary: wireSummary)
        .padding()
        .frame(width: 350)
}
