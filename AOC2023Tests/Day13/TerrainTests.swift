import XCTest

final class TerrainTests: XCTestCase {

    
    func testDetectHorizontalReflections() throws {
        let input = """
#.##..##.
..#.##.#.
##......#
##......#
..#.##.#.
..##..##.
#.#.##.#.
"""

        XCTAssertEqual(Set([5]), Day13.Terrain.detectHorizontalReflection(inInput:  input.components(separatedBy: .newlines).reject(\.isEmpty)))
        
    }
    
    
    func testDetectHorizontalReflection() throws {
        XCTAssertEqual(Set<Int>([5,7]), Day13.Terrain.detectHorizontalReflection(inLine: "#.##..##."))
        XCTAssertEqual(Set<Int>([1, 5]), Day13.Terrain.detectHorizontalReflection(inLine: "..#.##.#."))
        XCTAssertEqual(Set<Int>([1, 5]), Day13.Terrain.detectHorizontalReflection(inLine: "##......#"))
        XCTAssertEqual(Set<Int>([1, 5]), Day13.Terrain.detectHorizontalReflection(inLine: "..#.##.#."))
        XCTAssertEqual(Set<Int>([1, 3, 5, 7]), Day13.Terrain.detectHorizontalReflection(inLine: "..##..##."))
        XCTAssertEqual(Set<Int>([5]), Day13.Terrain.detectHorizontalReflection(inLine: "#.#.##.#."))

    }
    
    func testHasHorizontalReflection() throws {
        XCTAssertFalse(Day13.Terrain.hasHorizontalReflection(inLine: "#.##..##.", atColumn: 0))
        XCTAssertFalse(Day13.Terrain.hasHorizontalReflection(inLine: "#.##..##.", atColumn: 1))
        XCTAssertFalse(Day13.Terrain.hasHorizontalReflection(inLine: "#.##..##.", atColumn: 2))
        XCTAssertFalse(Day13.Terrain.hasHorizontalReflection(inLine: "#.##..##.", atColumn: 3))
        XCTAssertFalse(Day13.Terrain.hasHorizontalReflection(inLine: "#.##..##.", atColumn: 4))
        XCTAssertTrue(Day13.Terrain.hasHorizontalReflection(inLine: "#.##..##.", atColumn: 5))
        XCTAssertFalse(Day13.Terrain.hasHorizontalReflection(inLine: "#.##..##.", atColumn: 6))
        XCTAssertTrue(Day13.Terrain.hasHorizontalReflection(inLine: "#.##..##.", atColumn: 7))
        XCTAssertFalse(Day13.Terrain.hasHorizontalReflection(inLine: "#.##..##.", atColumn: 8))

    }

    func testDetectVerticalReflection() throws {
        let input = """
#.##..##.
..#.##.#.
##......#
##......#
..#.##.#.
..##..##.
#.#.##.#.
"""
    }
    



}
