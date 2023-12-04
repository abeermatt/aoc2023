import XCTest

final class EngineSchematicTests: XCTestCase {

//    "0123456789"
//    "467..114.."

    func testParsing_1() throws {
        let input = "467..114.."
        let engine = Day3.EngineSchematic.fromInput(input)
        XCTAssertEqual(2, engine.partNumbers.count)
        XCTAssertEqual(0, engine.symbols.count)
                
        XCTAssertTrue(engine.partNumbers.contains(Day3.PartNumber(x: 0, y: 0, value: 467)))
        XCTAssertTrue(engine.partNumbers.contains(Day3.PartNumber(x: 5, y: 0, value: 114)))
    }
    
    func testParsing_2() throws {
        let input = "617*......"
        let engine = Day3.EngineSchematic.fromInput(input)
        XCTAssertEqual(1, engine.partNumbers.count)
        XCTAssertEqual(1, engine.symbols.count)
                
        XCTAssertTrue(engine.partNumbers.contains(Day3.PartNumber(x: 0, y: 0, value: 617)))
        XCTAssertTrue(engine.symbols.contains(Day3.Symbol(x: 3, y: 0, value: "*")))
    }

    func testParsing_3() throws {
        let input = "......#..."
        let engine = Day3.EngineSchematic.fromInput(input)
        XCTAssertEqual(0, engine.partNumbers.count)
        XCTAssertEqual(1, engine.symbols.count)
                
        XCTAssertTrue(engine.symbols.contains(Day3.Symbol(x: 6, y: 0, value: "#")))
    }

    func testParsing_4() throws {
        let input = ".......123"
        let engine = Day3.EngineSchematic.fromInput(input)
        XCTAssertEqual(1, engine.partNumbers.count)
        XCTAssertEqual(0, engine.symbols.count)
                
        XCTAssertTrue(engine.partNumbers.contains(Day3.PartNumber(x: 7, y: 0, value: 123)))
    }
    
    func testGears() throws {
        let input = """
467..114..
...*......
..35..633.
"""
        let engine = Day3.EngineSchematic.fromInput(input)
        let gears = engine.gears()
        XCTAssertEqual(1, gears.count)
        
        XCTAssertTrue(gears.contains(Day3.Gear(left: Day3.PartNumber(x: 0, y: 0, value: 467), right: Day3.PartNumber(x: 2, y: 2, value: 35))))

    }

}
