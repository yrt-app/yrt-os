//
//  ContentViewTest.swift
//  YrtOSTests
//
//  Created by Lorenz Simon on 03.05.24.
//

import PreviewSnapshotsTesting
import SwiftUI
import XCTest

@testable import YrtOS

final class ContentViewTest: XCTestCase {
    func testSnapshots() throws {
        ContentView_Previews.snapshots.assertSnapshots(as: .previewSnapshot(size: (350, 500)))
    }
}
