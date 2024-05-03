//
//  WireListViewTest.swift
//  YrtOSTests
//
//  Created by Lorenz Simon on 03.05.24.
//

import PreviewSnapshotsTesting
import SwiftUI
import XCTest

@testable import YrtOS

final class WireListViewTest: XCTestCase {
    func testSnapshots() throws {
        WireListView_Previews.snapshots.assertSnapshots(as: .previewSnapshot(size: (350, 500)))
    }
}
