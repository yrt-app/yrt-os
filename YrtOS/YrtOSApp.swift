//
//  YrtOSApp.swift
//  YrtOS
//
//  Created by Lorenz Simon on 20.04.24.
//

import MenuBarExtraAccess
import SwiftUI

@main
struct YrtOSApp: App {
    @StateObject var hotKey = WindowHotKey(key: .x, modifiers: [.command, .option])
    
    var body: some Scene {
        MenuBarExtra {
            ContentView().frame(width: 350, height: 500)
        } label: {
            Image("AppTray")
                .renderingMode(.template)
        }
        .menuBarExtraStyle(.window)
        .menuBarExtraAccess(isPresented: $hotKey.showWindow)
    }
}
