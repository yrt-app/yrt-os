//
//  ContentView.swift
//  YrtOS
//
//  Created by Lorenz Simon on 20.04.24.
//

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
