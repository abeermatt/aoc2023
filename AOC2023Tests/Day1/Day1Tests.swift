import XCTest

final class Day1Tests: XCTestCase {


    func testPart1Example() throws {
        let input = """
        1abc2
        pqr3stu8vwx
        a1b2c3d4e5f
        treb7uchet
        """
        XCTAssertEqual(142, Day1.Part1.run(input))

    }
    func testPart1() throws  {
        let input = try TestHelpers.readFile(named: "Day1Part1")
        let value = Day1.Part1.run(input)
        XCTAssertEqual(54630, value)
    }

    func testPart2Example() throws {
        let input = """
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
"""
        let value = Day1.Part2.run(input)
        XCTAssertEqual(281, value)
    }
    
    func testPart2() throws {
        
        let input = try TestHelpers.readFile(named: "Day1Part2")
        XCTAssertEqual(54770, Day1.Part2.run(input))

    }
    
    func testExtractCalibrationValue() throws {
        XCTAssertEqual(88, Day1.Part2.extractCalibrationValue(from: "lvgxbch8nnnlpbvtgpqqmmm"))

        XCTAssertEqual(29, Day1.Part2.extractCalibrationValue(from: "two1nine"))
        XCTAssertEqual(83, Day1.Part2.extractCalibrationValue(from: "eightwothree"))
        XCTAssertEqual(13, Day1.Part2.extractCalibrationValue(from: "abcone2threexyz"))
        XCTAssertEqual(24, Day1.Part2.extractCalibrationValue(from: "xtwone3four"))
        XCTAssertEqual(42, Day1.Part2.extractCalibrationValue(from: "4nineeightseven2"))
        XCTAssertEqual(14, Day1.Part2.extractCalibrationValue(from: "zoneight234"))
        XCTAssertEqual(76, Day1.Part2.extractCalibrationValue(from: "7pqrstsixteen"))
        XCTAssertEqual(76, Day1.Part2.extractCalibrationValue(from: "sevenflknr33qtwosixstmsblmrzczdqflxg"))
        XCTAssertEqual(33, Day1.Part2.extractCalibrationValue(from: "three6gqfcml3zfxhfsvr"))
        XCTAssertEqual(71, Day1.Part2.extractCalibrationValue(from: "76six4blfmlclrcj4one"))
        XCTAssertEqual(73, Day1.Part2.extractCalibrationValue(from: "76six4blfmlclrcj4onethree"))
        XCTAssertEqual(71, Day1.Part2.extractCalibrationValue(from: "76six4blfmlclrcj4twone"))
        XCTAssertEqual(18, Day1.Part2.extractCalibrationValue(from: "oneight"))
        XCTAssertEqual(28, Day1.Part2.extractCalibrationValue(from: "twoneight"))
        XCTAssertEqual(11, Day1.Part2.extractCalibrationValue(from: "1"))
        XCTAssertEqual(11, Day1.Part2.extractCalibrationValue(from: "one"))
    }
        
}


