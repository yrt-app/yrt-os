//
//  HotKey.swift
//  YrtOS
//
//  Created by Lorenz Simon on 28.04.24.
//

import AppKit
import Foundation
import HotKey

class WindowHotKey: ObservableObject {
    let hotKey: HotKey
    
    @Published var showWindow = false

    init(key: Key, modifiers: NSEvent.ModifierFlags) {
        self.hotKey = HotKey(key: key, modifiers: modifiers)
        self.hotKey.keyDownHandler = { self.showWindow.toggle() }
    }
}
