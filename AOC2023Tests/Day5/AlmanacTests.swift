//
//  AlmanacTests.swift
//  AOC2023Tests
//
//  Created by Matthew Hobbs on 05/12/2023.
//

import XCTest

final class AlmanacTests: XCTestCase {
    let sampleInput = """
seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4
"""

    func testSamples() throws {
        let almanac = Day5.Almanac.fromInput(sampleInput)
        
        XCTAssertEqual(81, almanac.getSoil(forSeed: 79))
        XCTAssertEqual(81, almanac.getFertilizer(forSoil: 81))
        XCTAssertEqual(81, almanac.getWater(forFertilizer: 81))
        XCTAssertEqual(74, almanac.getLight(forWater: 81))
        XCTAssertEqual(78, almanac.getTemperature(forLight: 74))
        XCTAssertEqual(78, almanac.getHumidity(forTemperature: 78))
        XCTAssertEqual(82, almanac.getLocation(forHumidity: 78))
        
        XCTAssertEqual(14, almanac.getSoil(forSeed: 14))
        XCTAssertEqual(53, almanac.getFertilizer(forSoil: 14))
        XCTAssertEqual(49, almanac.getWater(forFertilizer: 53))
        XCTAssertEqual(42, almanac.getLight(forWater: 49))
        XCTAssertEqual(42, almanac.getTemperature(forLight: 42))
        XCTAssertEqual(43, almanac.getHumidity(forTemperature: 42))
        XCTAssertEqual(43, almanac.getLocation(forHumidity: 43))

        XCTAssertEqual(57, almanac.getSoil(forSeed: 55))
        XCTAssertEqual(57, almanac.getFertilizer(forSoil: 57))
        XCTAssertEqual(53, almanac.getWater(forFertilizer: 57))
        XCTAssertEqual(46, almanac.getLight(forWater: 53))
        XCTAssertEqual(82, almanac.getTemperature(forLight: 46))
        XCTAssertEqual(82, almanac.getHumidity(forTemperature: 82))
        XCTAssertEqual(86, almanac.getLocation(forHumidity: 82))

        XCTAssertEqual(13, almanac.getSoil(forSeed: 13))
        XCTAssertEqual(52, almanac.getFertilizer(forSoil: 13))
        XCTAssertEqual(41, almanac.getWater(forFertilizer: 52))
        XCTAssertEqual(34, almanac.getLight(forWater: 41))
        XCTAssertEqual(34, almanac.getTemperature(forLight: 34))
        XCTAssertEqual(35, almanac.getHumidity(forTemperature: 34))
        XCTAssertEqual(35, almanac.getLocation(forHumidity: 35))

    }
    
    func testGetLocationBySeed() throws {
        var almanac = Day5.Almanac.fromInput(sampleInput)
        XCTAssertEqual(82, almanac.getLocation(forSeed: 79))
        XCTAssertEqual(43, almanac.getLocation(forSeed: 14))
        XCTAssertEqual(86, almanac.getLocation(forSeed: 55))
        XCTAssertEqual(35, almanac.getLocation(forSeed: 13))

    }

}
