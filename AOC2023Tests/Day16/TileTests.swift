import XCTest

final class TileTests: XCTestCase {

    func testEmptySpace() throws {
        XCTAssertEqual(Day16.Tile.emptySpace.next(headingInDirection: .up), [.up])
        XCTAssertEqual(Day16.Tile.emptySpace.next(headingInDirection: .down), [.down])
        XCTAssertEqual(Day16.Tile.emptySpace.next(headingInDirection: .left), [.left])
        XCTAssertEqual(Day16.Tile.emptySpace.next(headingInDirection: .right), [.right])
    }
    
    func testForwardMirror() throws {
        XCTAssertEqual(Day16.Tile.forwardMirror.next(headingInDirection: .up), [.right])
        XCTAssertEqual(Day16.Tile.forwardMirror.next(headingInDirection: .down), [.left])
        XCTAssertEqual(Day16.Tile.forwardMirror.next(headingInDirection: .left), [.down])
        XCTAssertEqual(Day16.Tile.forwardMirror.next(headingInDirection: .right), [.up])
    }

    func testBackwardMirror() throws {
        XCTAssertEqual(Day16.Tile.backwardMirror.next(headingInDirection: .up), [.left])
        XCTAssertEqual(Day16.Tile.backwardMirror.next(headingInDirection: .down), [.right])
        XCTAssertEqual(Day16.Tile.backwardMirror.next(headingInDirection: .left), [.up])
        XCTAssertEqual(Day16.Tile.backwardMirror.next(headingInDirection: .right), [.down])
    }

    func testVerticalSplitter() throws {
        XCTAssertEqual(Day16.Tile.verticalSplitter.next(headingInDirection: .up), [.up])
        XCTAssertEqual(Day16.Tile.verticalSplitter.next(headingInDirection: .down), [.down])
        XCTAssertEqual(Day16.Tile.verticalSplitter.next(headingInDirection: .left), [.up, .down])
        XCTAssertEqual(Day16.Tile.verticalSplitter.next(headingInDirection: .right), [.up, .down])
    }
    
    func testHorizontalSplitter() throws {
        XCTAssertEqual(Day16.Tile.horizontalSplitter.next(headingInDirection: .up), [.left, .right])
        XCTAssertEqual(Day16.Tile.horizontalSplitter.next(headingInDirection: .down), [.left, .right])
        XCTAssertEqual(Day16.Tile.horizontalSplitter.next(headingInDirection: .left), [.left])
        XCTAssertEqual(Day16.Tile.horizontalSplitter.next(headingInDirection: .right), [.right])
    }




}
