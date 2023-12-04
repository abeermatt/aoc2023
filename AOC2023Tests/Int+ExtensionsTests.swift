import XCTest

final class Int_ExtensionsTests: XCTestCase {

    func testDigits() throws {
        XCTAssertEqual(1, 0.digits())
        XCTAssertEqual(1, 1.digits())
        XCTAssertEqual(2, 12.digits())
        XCTAssertEqual(3, 123.digits())
        XCTAssertEqual(1, (-1).digits())
        XCTAssertEqual(2, (-12).digits())
        XCTAssertEqual(3, (-123).digits())

        
    }


}
