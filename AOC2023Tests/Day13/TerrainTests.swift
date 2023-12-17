import XCTest

final class TerrainTests: XCTestCase {

    
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
        
        XCTAssertEqual(Set([5]), Day13.Terrain.detectVerticalReflection(inInput:  input.splitByNewlines()))
        
    }
    
    
    func testDetectVerticalReflection() throws {
        XCTAssertEqual(Set<Int>([5,7]), Day13.Terrain.detectVerticalReflection(inLine: "#.##..##."))
        XCTAssertEqual(Set<Int>([1, 5]), Day13.Terrain.detectVerticalReflection(inLine: "..#.##.#."))
        XCTAssertEqual(Set<Int>([1, 5]), Day13.Terrain.detectVerticalReflection(inLine: "##......#"))
        XCTAssertEqual(Set<Int>([1, 5]), Day13.Terrain.detectVerticalReflection(inLine: "..#.##.#."))
        XCTAssertEqual(Set<Int>([1, 3, 5, 7]), Day13.Terrain.detectVerticalReflection(inLine: "..##..##."))
        XCTAssertEqual(Set<Int>([5]), Day13.Terrain.detectVerticalReflection(inLine: "#.#.##.#."))
        XCTAssertEqual(Set<Int>([]), Day13.Terrain.detectVerticalReflection(inLine: "#.###.#.#."))

    }
    
    func testHasVerticalReflection() throws {
        XCTAssertFalse(Day13.Terrain.hasVerticalReflection(inLine: "#.##..##.", atColumn: 0))
        XCTAssertFalse(Day13.Terrain.hasVerticalReflection(inLine: "#.##..##.", atColumn: 1))
        XCTAssertFalse(Day13.Terrain.hasVerticalReflection(inLine: "#.##..##.", atColumn: 2))
        XCTAssertFalse(Day13.Terrain.hasVerticalReflection(inLine: "#.##..##.", atColumn: 3))
        XCTAssertFalse(Day13.Terrain.hasVerticalReflection(inLine: "#.##..##.", atColumn: 4))
        XCTAssertTrue(Day13.Terrain.hasVerticalReflection(inLine: "#.##..##.", atColumn: 5))
        XCTAssertFalse(Day13.Terrain.hasVerticalReflection(inLine: "#.##..##.", atColumn: 6))
        XCTAssertTrue(Day13.Terrain.hasVerticalReflection(inLine: "#.##..##.", atColumn: 7))
        XCTAssertFalse(Day13.Terrain.hasVerticalReflection(inLine: "#.##..##.", atColumn: 8))
    }

    func testDetectHorizontalReflection() throws {
        let input = """
#...##..#
#....#..#
..##..###
#####.##.
#####.##.
..##..###
#....#..#
"""
        
        XCTAssertEqual(Set([4]), Day13.Terrain.detectHorizontalReflection(inInput:  input.components(separatedBy: .newlines).reject(\.isEmpty)))

    }
    
    func testHasHorizontalReflection() throws {
        var input = """
#...##..#
#....#..#
""".splitByNewlines()
        
        XCTAssertFalse(Day13.Terrain.hasHorizontalReflection(inLines: input, atRow: 0))
        XCTAssertFalse(Day13.Terrain.hasHorizontalReflection(inLines: input, atRow: 1))
        XCTAssertFalse(Day13.Terrain.hasHorizontalReflection(inLines: input, atRow: 2))
        
        input = """
#....#..#
#....#..#
""".splitByNewlines()
        
        XCTAssertFalse(Day13.Terrain.hasHorizontalReflection(inLines: input, atRow: 0))
        XCTAssertTrue(Day13.Terrain.hasHorizontalReflection(inLines: input, atRow: 1))
        XCTAssertFalse(Day13.Terrain.hasHorizontalReflection(inLines: input, atRow: 2))

        input = """
#....#..#
#....#..#
#....#.##
""".splitByNewlines()
        
        XCTAssertFalse(Day13.Terrain.hasHorizontalReflection(inLines: input, atRow: 0))
        XCTAssertTrue(Day13.Terrain.hasHorizontalReflection(inLines: input, atRow: 1))
        XCTAssertFalse(Day13.Terrain.hasHorizontalReflection(inLines: input, atRow: 2))

        input = """
#....#.##
#....#..#
#....#..#
""".splitByNewlines()
        
        XCTAssertFalse(Day13.Terrain.hasHorizontalReflection(inLines: input, atRow: 0))
        XCTAssertFalse(Day13.Terrain.hasHorizontalReflection(inLines: input, atRow: 1))
        XCTAssertTrue(Day13.Terrain.hasHorizontalReflection(inLines: input, atRow: 2))
    }



}
