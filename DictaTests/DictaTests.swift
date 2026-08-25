import XCTest
@testable import Dicta

@MainActor
final class DictaTests: XCTestCase {
    func testInitialStateIsReady() {
        let model = DictaViewModel()
        XCTAssertFalse(model.isRecording)
        XCTAssertTrue(model.transcript.isEmpty)
        XCTAssertEqual(model.statusMessage, "Ready")
    }
}
