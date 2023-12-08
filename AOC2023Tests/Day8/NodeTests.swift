import XCTest

final class NodeTests: XCTestCase {

    func testParsing() throws {
        let node = Day8.Node.parse("AAA = (BBB, CCC)")
        XCTAssertEqual("AAA", node.id)
        XCTAssertEqual("BBB", node.left)
        XCTAssertEqual("CCC", node.right)
    }

}
