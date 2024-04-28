//
//  ContentView.swift
//  YrtOS
//
//  Created by Lorenz Simon on 20.04.24.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0

    var body: some View {
        VStack {
            ControlBarView(count: $count).frame(height: 25)
            Spacer()
            WireListItemView(
                emoij: "🤙",
                description: "Team X Hangout",
                onlineCount: 4
            )
            Spacer()
        }
    }
}

#Preview {
    ContentView()
        .padding()
        .frame(width: 350, height: 500)
}
