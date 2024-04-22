//
//  YrtOSApp.swift
//  YrtOS
//
//  Created by Lorenz Simon on 20.04.24.
//

import SwiftUI

@main
struct YrtOSApp: App {
    var body: some Scene {
        MenuBarExtra {
            ContentView()
                .padding()
                .frame(width: 350, height: 500)
        } label: {
            Image("AppTray")
                .renderingMode(.template)
        }.menuBarExtraStyle(.window)
    }
}
