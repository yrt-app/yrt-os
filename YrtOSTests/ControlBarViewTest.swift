//
//  ControlBarViewTest.swift
//  YrtOSTests
//
//  Created by Lorenz Simon on 02.05.24.
//

import PreviewSnapshotsTesting
import SwiftUI
import XCTest

@testable import YrtOS

final class ControlBarViewTest: XCTestCase {
    func testSnapshots() throws {
        ContentBarView_Previews.snapshots.assertSnapshots(as: .previewSnapshot(size: (350, 50)))
    }
}
