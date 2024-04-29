//
//  WireSummaryStore.swift
//  YrtOS
//
//  Created by Lorenz Simon on 29.04.24.
//

import Foundation

class WireSummaryStore: ObservableObject {
    @Published var connectedWires = [
        WireSummary(
            id: UUID().uuidString,
            emoji: "🤙",
            description: "Team X Hangout",
            onlineCount: 4
        ),
        WireSummary(
            id: UUID().uuidString,
            emoji: "💻",
            description: "Focus Group",
            onlineCount: 1
        )
    ]
    
    @Published var availableWires = [
        WireSummary(
            id: UUID().uuidString,
            emoji: "☕️",
            description: "Coffee Roulette",
            onlineCount: 7
        ),
        WireSummary(
            id: UUID().uuidString,
            emoji: "🌸",
            description: "Barcelona Spring I/O 2024",
            onlineCount: 4
        ),
        WireSummary(
            id: UUID().uuidString,
            emoji: "🙏",
            description: "PX - Help Wanted",
            onlineCount: 2
        ),
        WireSummary(
            id: UUID().uuidString,
            emoji: "💡",
            description: "PX - Brainstorming",
            onlineCount: 0
        ),
        WireSummary(
            id: UUID().uuidString,
            emoji: "🧑‍💻",
            description: "PX - Pair Programming",
            onlineCount: 0
        ),
        WireSummary(
            id: UUID().uuidString,
            emoji: "🇩🇪",
            description: "German Learning",
            onlineCount: 0
        ),
        WireSummary(
            id: UUID().uuidString,
            emoji: "🚨",
            description: "SIRI",
            onlineCount: 0
        ),
        WireSummary(
            id: UUID().uuidString,
            emoji: "🚀",
            description: "StartUP Founders Club",
            onlineCount: 0
        )
    ]
}
