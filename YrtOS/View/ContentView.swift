//
//  ContentView.swift
//  YrtOS
//
//  Created by Lorenz Simon on 20.04.24.
//

import PreviewSnapshots
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            ControlBarView()
                .frame(height: 25)
                .padding()
            ScrollView {
                WireListView().padding(.horizontal)
            }.scrollIndicators(.hidden)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
        .frame(width: 350, height: 500)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        snapshots.previews
    }
    
    static var snapshots: PreviewSnapshots<PreviewState> {
        PreviewSnapshots(
            configurations: [
                .init(
                    name: "Default",
                    state: PreviewState()
                ),
            ],
            configure: { _ in
                ContentView()
                    .frame(width: 350, height: 500)
            }
        )
    }
    
    struct PreviewState {}
}
