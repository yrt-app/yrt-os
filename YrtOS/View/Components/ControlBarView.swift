//
//  ControlBarView.swift
//  YrtOS
//
//  Created by Lorenz Simon on 23.04.24.
//

import SwiftUI

struct ControlBarView: View {
    @Binding var count: Int
    @FocusState var searchFocus
    @State var search = false
    @State var searchText = ""
    
    var body: some View {
        HStack {
            if !search {
                logo.frame(maxWidth: .infinity, alignment: .leading)
                    .transition(.offset(x: -500, y: 0))
                sessionControls.frame(maxWidth: .infinity, alignment: .center)
                    .transition(.offset(x: -400, y: 0))
            }
            appControls.frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
    
    var logo: some View {
        Image("Logo")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
    }
    
    var sessionControls: some View {
        HStack(spacing: 5) {
            SquareButton {
                count += 1
            } label: {
                Image(systemName: "speaker.wave.2.fill")
            }
            SquareButton {
                count += 1
            } label: {
                Image(systemName: "mic.fill")
            }
            SquareButton {
                count += 1
            } label: {
                Image(systemName: "rectangle.inset.filled.on.rectangle")
            }
        }
    }
    
    var appControls: some View {
        HStack {
            SquareButton {
                withAnimation(.easeInOut(duration: 0.2)) {
                    search.toggle()
                }
            } label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .symbolVariant(search ? .none : .fill)
                    .symbolVariant(search ? .none : .circle)
                    .scaleEffect(search ? 0.7 : 1)
                    .frame(height: 22)
            }
            if search {
                TextField("Search", text: $searchText)
                    .textFieldStyle(.plain)
                    .focused($searchFocus)
                    .onAppear {
                        searchFocus = true
                    }
                    .onDisappear {
                        searchFocus = false
                    }
                    .transition(.opacity.combined(with: .move(edge: .trailing)))
                SquareButton(hoverEffect: .fill) {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        search.toggle()
                    }
                } label: {
                    Image(systemName: "xmark")
                }
            }
            SquareMenuButton(hoverEffect: .fill) {
                Button {
                    count += 1
                } label: {
                    Image(systemName: "plus")
                    Text("New Wire")
                }
                Button {
                    count += 1
                } label: {
                    Image(systemName: "person.badge.plus")
                    Text("Invite Friend")
                }
                Divider()
                Button {
                    count += 1
                } label: {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            } label: {
                Image(systemName: "chevron.down")
            }
        }
    }
}

#Preview {
    struct Container: View {
        @State var count = 0
        
        var body: some View {
            ControlBarView(count: $count)
                .padding()
                .frame(width: 350)
        }
    }
    
    return Container()
}
