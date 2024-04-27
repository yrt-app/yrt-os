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
    
    @State var showSearch = false
    @State var searchText = ""
    
    let searchAnimation = Animation.easeInOut(duration: 0.2)
    
    var body: some View {
        HStack {
            if !showSearch {
                logo
                sessionControls
            }
            appControls
        }
    }
    
    var logo: some View {
        Image("Logo")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity, maxHeight: 25, alignment: .leading)
            .transition(.offset(x: -500, y: 0))
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
        .frame(maxWidth: .infinity, alignment: .center)
        .transition(.offset(x: -400, y: 0))
    }
    
    var appControls: some View {
        HStack {
            search
            menu
        }.frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    @ViewBuilder
    var search: some View {
        SquareButton {
            withAnimation(searchAnimation) {
                showSearch.toggle()
            }
        } label: {
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .symbolVariant(showSearch ? .none : .fill)
                .symbolVariant(showSearch ? .none : .circle)
                .scaleEffect(showSearch ? 0.7 : 1)
                .frame(height: 22)
        }.disabled(showSearch)
        
        if showSearch {
            TextField("Search", text: $searchText)
                .textFieldStyle(.plain)
                .focused($searchFocus)
                .transition(.opacity.combined(with: .move(edge: .trailing)))
            SquareButton(hoverEffect: .fill) {
                withAnimation(searchAnimation) {
                    showSearch.toggle()
                }
            } label: {
                Image(systemName: "xmark")
            }
            .onAppear {
                searchFocus = true
            }
            .onDisappear {
                searchFocus = false
            }
        }
    }
    
    @ViewBuilder
    var menu: some View {
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
