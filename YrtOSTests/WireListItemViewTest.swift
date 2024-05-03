//
//  WireListItemViewTest.swift
//  YrtOSTests
//
//  Created by Lorenz Simon on 03.05.24.
//

import PreviewSnapshotsTesting
import SwiftUI
import XCTest

@testable import YrtOS

final class WireListItemViewTest: XCTestCase {
    func testSnapshots() throws {
        WireListItemView_Previews.snapshots.assertSnapshots(as: .previewSnapshot(size: (350, 50)))
    }
}
