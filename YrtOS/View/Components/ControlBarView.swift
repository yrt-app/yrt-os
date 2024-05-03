//
//  ControlBarView.swift
//  YrtOS
//
//  Created by Lorenz Simon on 23.04.24.
//

import PreviewSnapshots
import SwiftUI

struct ControlBarView: View {
    typealias AID = AccessibilityIdentifier.ControlBarView
    
    let searchAnimation = Animation.easeInOut(duration: 0.25)
    
    @FocusState var searchFocus

    @State var showSearch = false
    @State var searchText = ""

    var body: some View {
        HStack {
            if !showSearch {
                logo.foregroundStyle(.secondary)
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
            .transition(.offset(x: -200, y: 0))
    }

    var sessionControls: some View {
        HStack(spacing: 5) {
            SquareButton {
                //
            } label: {
                Image(systemName: "speaker.wave.2.fill")
            }.keyboardShortcut("s")
            SquareButton {
                //
            } label: {
                Image(systemName: "mic.fill")
            }.keyboardShortcut("m")
            SquareButton {
                //
            } label: {
                Image(systemName: "rectangle.inset.filled.on.rectangle")
            }.keyboardShortcut("v")
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .transition(.offset(x: -300, y: 0))
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
            let foreground = showSearch ? AnyShapeStyle(.secondary) : AnyShapeStyle(.opacity(1))

            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .symbolVariant(showSearch ? .none : .fill)
                .symbolVariant(showSearch ? .none : .circle)
                .foregroundStyle(foreground)
                .scaleEffect(showSearch ? 0.7 : 1)
                .frame(height: 22)
        }
        .accessibilityIdentifier(AID.searchShowButton)
        .keyboardShortcut("k")
        .disabled(showSearch)

        if showSearch {
            TextField("Search", text: $searchText)
                .accessibilityIdentifier(AID.searchTextField)
                .textFieldStyle(.plain)
                .focused($searchFocus)
                .onSubmit {
                    withAnimation(searchAnimation) {
                        showSearch.toggle()
                    }
                }
                .transition(.opacity.combined(with: .move(edge: .trailing)))
            CircleButton(hoverEffect: .fill) {
                withAnimation(searchAnimation) {
                    showSearch.toggle()
                }
            } label: {
                Image(systemName: "xmark")
            }
            .accessibilityIdentifier(AID.searchHideButton)
            .keyboardShortcut(.cancelAction)
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
                //
            } label: {
                Image(systemName: "plus")
                Text("New Wire")
            }
            Button {
                //
            } label: {
                Image(systemName: "person.badge.plus")
                Text("Invite Friend")
            }
            Divider()
            Button {
                //
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
    ControlBarView()
        .padding()
        .frame(width: 350)
}

struct ContentBarView_Previews: PreviewProvider {
    static var previews: some View {
        snapshots.previews
    }
    
    static var snapshots: PreviewSnapshots<Bool> {
        PreviewSnapshots(
            configurations: [
                .init(name: "Hide Search", state: false),
                .init(name: "Show Search", state: true),
            ],
            configure: { showSearch in
                ControlBarView(showSearch: showSearch)
                    .padding()
                    .frame(width: 350)
            }
        )
    }
}
