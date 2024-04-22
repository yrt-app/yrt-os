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
            HStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 25, alignment: .leading)
            
                HStack(spacing: 0) {
                    Button {
                        count += 1
                    } label: {
                        Image(systemName: "speaker.wave.2.fill")
                            .padding(5)
                    }.buttonStyle(.borderless)
                    Button {
                        count += 1
                    } label: {
                        Image(systemName: "mic.fill")
                            .padding(5)
                    }.buttonStyle(.borderless)
                    Button {
                        count += 1
                    } label: {
                        Image(systemName: "rectangle.inset.filled.on.rectangle")
                            .padding(5)
                    }.buttonStyle(.borderless)
                }.frame(maxWidth: .infinity, alignment: .center)
                
                HStack {
                    Button {
                        count += 1
                    } label: {
                        Image(systemName: "magnifyingglass.circle.fill")                    
                            .resizable()
                            .scaledToFit()
                            .frame(height: 22)
                            .padding(1)
                    }.buttonStyle(.borderless)
                    Button {
                        count += 1
                    } label: {
                        Image(systemName: "chevron.down")
                            .padding(5)
                    }.buttonStyle(.borderless)
                }.frame(maxWidth: .infinity, alignment: .trailing)
            }
            Spacer()
            Button {
                count += 1
            } label: {
                Text("Count: \(count)")
            }.padding()
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
