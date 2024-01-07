import XCTest

class Day16Tests: XCTestCase {
        
    func testPart1Sample1() throws {
        let input = #"""
.|...\....
|.-.\.....
.....|-...
........|.
..........
.........\
..../.\\..
.-.-/..|..
.|....-|.\
..//.|....
"""#
        let sum = Day16.Part1.run(input)
        XCTAssertEqual(46, sum)
    }

    func testPart1() async throws {
        let input = try TestHelpers.readFile(named: "Day16")
        let sum = Day16.Part1.run(input)
        XCTAssertEqual(7951, sum)
    }
        
    func testPart2Sample() throws {
        let input = """
        rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7
        """

        let sequence = Day15.InitializationSequence.parse(input)
        XCTAssertEqual(sequence.totalFocussingPower(), 145)
    }

    func testPart2() throws {
        let input = try TestHelpers.readFile(named: "Day16")
        let sum = Day16.Part2.run(input)
        XCTAssertEqual(262044, sum)
    }


}
