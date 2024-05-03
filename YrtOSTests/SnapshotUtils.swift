//
//  Utils.swift
//  YrtOSTests
//
//  Created by Lorenz Simon on 03.05.24.
//

import PreviewSnapshotsTesting
import SwiftUI

extension Snapshotting where Value: SwiftUI.View, Format == NSImage {
    static func previewSnapshot(
        userInterfaceStyle: UserInterfaceStyle = .dark,
        size: (Int, Int) = (350, 500)
    ) -> Self {
        let snapshotting = Snapshotting<NSView, NSImage>
            .image(size: .init(width: size.0, height: size.1))
            .pullback { (view: Value) in
                let view = NSHostingView(rootView: view.environment(\.colorScheme, userInterfaceStyle.colorScheme))
                view.wantsLayer = true
                view.layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor
                return view
            }
        
        return Snapshotting(
            pathExtension: snapshotting.pathExtension,
            diffing: snapshotting.diffing,
            asyncSnapshot: { view in
                Async { callback in
                    userInterfaceStyle.appearance.performAsCurrentDrawingAppearance {
                        snapshotting.snapshot(view).run(callback)
                    }
                }
            }
        )
    }
}

enum UserInterfaceStyle {
    case light, dark
    
    var colorScheme: ColorScheme {
        switch self {
        case .light: return .light
        case .dark: return .dark
        }
    }
    
    var appearance: NSAppearance {
        switch self {
        case .light: return NSAppearance(named: .aqua)!
        case .dark: return NSAppearance(named: .darkAqua)!
        }
    }
}
