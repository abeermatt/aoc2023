import XCTest

final class TerrainTests: XCTestCase {

    func testVerticalReflections() throws {
        let input = """
#.##..##.
..#.##.#.
##......#
##......#
..#.##.#.
..##..##.
#.#.##.#.
"""
        XCTAssertEqual([Day13.Reflection.horizontal(5)], Day13.Terrain.parse(input).reflections())
        
    }
    
    func testDetectVerticalReflections() throws {
        let input = """
#.##..##.
..#.##.#.
##......#
##......#
..#.##.#.
..##..##.
#.#.##.#.
"""

        XCTAssertEqual(Set([5]), Day13.Terrain.detectVerticalReflection(inInput:  input.components(separatedBy: .newlines).reject(\.isEmpty)))
        
    }
    
    


    func testDetectVerticalReflection() throws {
        XCTAssertEqual(Set<Int>([5,7]), Day13.Terrain.detectVerticalReflection(inLine: "#.##..##."))
        XCTAssertEqual(Set<Int>([1, 5]), Day13.Terrain.detectVerticalReflection(inLine: "..#.##.#."))
        XCTAssertEqual(Set<Int>([1, 5]), Day13.Terrain.detectVerticalReflection(inLine: "##......#"))
        XCTAssertEqual(Set<Int>([1, 5]), Day13.Terrain.detectVerticalReflection(inLine: "..#.##.#."))
        XCTAssertEqual(Set<Int>([1, 3, 5, 7]), Day13.Terrain.detectVerticalReflection(inLine: "..##..##."))
        XCTAssertEqual(Set<Int>([5]), Day13.Terrain.detectVerticalReflection(inLine: "#.#.##.#."))

    }
    
    func testHasReflection() throws {
        XCTAssertFalse(Day13.Terrain.hasReflection(inLine: "#.##..##.", atColumn: 0))
        XCTAssertFalse(Day13.Terrain.hasReflection(inLine: "#.##..##.", atColumn: 1))
        XCTAssertFalse(Day13.Terrain.hasReflection(inLine: "#.##..##.", atColumn: 2))
        XCTAssertFalse(Day13.Terrain.hasReflection(inLine: "#.##..##.", atColumn: 3))
        XCTAssertFalse(Day13.Terrain.hasReflection(inLine: "#.##..##.", atColumn: 4))
        XCTAssertTrue(Day13.Terrain.hasReflection(inLine: "#.##..##.", atColumn: 5))
        XCTAssertFalse(Day13.Terrain.hasReflection(inLine: "#.##..##.", atColumn: 6))
        XCTAssertTrue(Day13.Terrain.hasReflection(inLine: "#.##..##.", atColumn: 7))
        XCTAssertFalse(Day13.Terrain.hasReflection(inLine: "#.##..##.", atColumn: 8))

    }


}
