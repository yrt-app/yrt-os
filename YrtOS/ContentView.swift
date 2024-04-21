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
        Button {
            count += 1
        } label: {
            Text("Count: \(count)")
        }.padding()
    }
}

#Preview {
    ContentView()
}
