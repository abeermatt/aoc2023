import XCTest

class Day15Tests: XCTestCase {
        
    func testPart1Sample1() throws {
        let input = """
        rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7
        """
        let sum = Day15.Part1.run(input)
        XCTAssertEqual(1320, sum)
    }

    func testPart1() async throws {
        let input = try TestHelpers.readFile(named: "Day15")
        let sum = Day15.Part1.run(input)
        XCTAssertEqual(504449, sum)
    }
        
    func testPart2Sample() throws {
    }

    func testPart2() throws {
        let input = try TestHelpers.readFile(named: "Day15")
        let sum = Day15.Part2.run(input)
        XCTAssertEqual(504449, sum)
    }


}
