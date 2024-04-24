//
//  ControlBarView.swift
//  YrtOS
//
//  Created by Lorenz Simon on 23.04.24.
//

import SwiftUI

struct ControlBarView: View {
    @Binding var count: Int
    
    var body: some View {
        HStack {
            logo.frame(maxWidth: .infinity, maxHeight: 25, alignment: .leading)
            sessionControls.frame(maxWidth: .infinity, alignment: .center)
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
                count += 1
            } label: {
                Image(systemName: "magnifyingglass.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 22)
            }
            SquareMenuButton(hoverEffect: .fill) {
                Button {
                    //
                } label: {
                    Text("Create new wire")
                }
                Button {
                    //
                } label: {
                    Text("Invite friend")
                }
                Divider()
                Button {
                    //
                } label: {
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
