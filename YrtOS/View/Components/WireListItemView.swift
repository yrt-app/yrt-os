//
//  WireListItem.swift
//  YrtOS
//
//  Created by Lorenz Simon on 28.04.24.
//

import PreviewSnapshots
import SwiftUI

struct WireListItemView: View {
    let wireSummary: WireSummary

    @State var showControls = false

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
            }
            else {
                showControls = false
            }
        }
    }

    var avatar: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(.secondary.opacity(0.1))
            .strokeBorder(.secondary.opacity(0.2))
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

            let onlineInfo =
                if wireSummary.onlineCount > 0 {
                    Text("\(String(wireSummary.onlineCount)) online")
                        .foregroundStyle(.green)
                }
                else {
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

struct WireListItemView_Previews: PreviewProvider {
    static var previews: some View {
        snapshots.previews
    }
    
    static var snapshots: PreviewSnapshots<PreviewState> {
        let shortWireSummary = WireSummary(
            id: UUID().uuidString,
            emoji: "🤙",
            description: "Team X Hangout",
            onlineCount: 4
        )
        let longWireSummary = WireSummary(
            id: UUID().uuidString,
            emoji: "🤙",
            description: "Team X Hangout With a Long Description",
            onlineCount: 4
        )
        
        return PreviewSnapshots(
            configurations: [
                .init(
                    name: "Hide Controls Short Summary",
                    state: PreviewState(
                        wireSummary: shortWireSummary,
                        showControls: false
                    )
                ),
                .init(
                    name: "Show Controls Short Summary",
                    state: PreviewState(
                        wireSummary: shortWireSummary,
                        showControls: true
                    )
                ),
                .init(
                    name: "Hide Controls Long Summary",
                    state: PreviewState(
                        wireSummary: longWireSummary,
                        showControls: false
                    )
                ),
                .init(
                    name: "Show Controls Long Summary",
                    state: PreviewState(
                        wireSummary: longWireSummary,
                        showControls: true
                    )
                ),
            ],
            configure: { state in
                WireListItemView(
                    wireSummary: state.wireSummary,
                    showControls: state.showControls
                )
                .padding()
                .frame(width: 350)
            }
        )
    }
    
    struct PreviewState {
        let wireSummary: WireSummary
        let showControls: Bool
    }
}
