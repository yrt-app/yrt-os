//
//  AccessibilityIdentifier.swift
//  YrtOS
//
//  Created by Lorenz Simon on 01.05.24.
//

import Foundation

struct AccessibilityIdentifier {
    struct ControlBarView {
        static let SEARCH_SHOW_BUTTON = "\(Self.self)ButtonSearchShow"
        static let SEARCH_HIDE_BUTTON = "\(Self.self)ButtonSearchHide"
        static let SEARCH_TEXT_FIELD = "\(Self.self)TextFieldSearch"
    }
}
