//
//  Item.swift
//  YrtOS
//
//  Created by Lorenz Simon on 20.04.24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
