import XCTest

final class LeastCommonMultiplerCalculatorTests: XCTestCase {

    func testCalculate() throws {
        let calculator = LeastCommonMultiplerCalculator()
        XCTAssertEqual(84, calculator.lcm(forNumbers: [4, 7, 12, 21, 42]))
        XCTAssertEqual(12, calculator.lcm(forNumbers: [3, 4, 6]))
        XCTAssertEqual(504, calculator.lcm(forNumbers: [8, 9, 21]))
        XCTAssertEqual(42, calculator.lcm(forNumbers: [6, 21]))
        
    }


}
