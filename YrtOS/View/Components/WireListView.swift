//
//  WireListView.swift
//  YrtOS
//
//  Created by Lorenz Simon on 29.04.24.
//

import PreviewSnapshots
import SwiftUI

struct WireListView: View {
    @StateObject var wireStore = WireSummaryStore()

    var body: some View {
        VStack(spacing: 10) {
            if wireStore.connectedWires.count > 0 {
                connected
                Divider()
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
                Text("Connected")
                    .font(.caption)
                    .textCase(.uppercase)
                    .fontWeight(.medium)
                Spacer()
            }
            LazyVStack(spacing: 0) {
                ForEach(wireStore.connectedWires) { wire in
                    wire.toWireListItemView()
                }
            }
        }
    }

    @ViewBuilder
    var available: some View {
        HStack {
            Text("􀙫 Wires")
                .font(.title3)
                .textCase(.uppercase)
                .fontWeight(.medium)
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

struct WireListView_Previews: PreviewProvider {
    static var previews: some View {
        snapshots.previews
    }
    
    static var snapshots: PreviewSnapshots<WireSummaryStore> {
        let connected = WireSummaryStore()
        let disconnected = WireSummaryStore(connectedWires: [])
        
        return PreviewSnapshots(
            configurations: [
                .init(
                    name: "Connected",
                    state: connected
                ),
                .init(
                    name: "Disconnected",
                    state: disconnected
                )
            ],
            configure: { wireStore in
                ScrollView {
                    WireListView(wireStore: wireStore).padding()
                }.frame(width: 350, height: 500)
            }
        )
    }
}
