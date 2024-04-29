//
//  WireListView.swift
//  YrtOS
//
//  Created by Lorenz Simon on 29.04.24.
//

import SwiftUI

struct WireListView: View {
    @StateObject var wireStore = WireSummaryStore()

    var body: some View {
        VStack(spacing: 10) {
            if wireStore.connectedWires.count > 0 {
                connected
            }
            available
        }
    }

    @ViewBuilder
    var connected: some View {
        VStack(spacing: 5) {
            HStack(spacing: 5) {
                Text("X")
                    .hidden()
                    .background {
                        Circle().fill(.green)
                    }
                Text("CONNECTED")
                    .font(.caption)
                    .fontWeight(.medium)
                Spacer()
            }
            LazyVStack(spacing: 0) {
                ForEach(wireStore.connectedWires) { wire in
                    wire.toWireListItemView()
                }
            }
        }
        Divider()
    }

    @ViewBuilder
    var available: some View {
        HStack {
            Text("Wires")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
        }
        LazyVStack(spacing: 0) {
            ForEach(wireStore.availableWires) { wire in
                wire.toWireListItemView()
            }
        }
    }
}

extension WireSummary {
    fileprivate func toWireListItemView() -> some View {
        WireListItemView(wireSummary: self)
            .scrollTransition { content, phase in
                content.opacity(phase.isIdentity ? 1 : 0)
            }
    }
}

#Preview {
    ScrollView {
        WireListView().padding()
    }.frame(width: 350, height: 500)
}
