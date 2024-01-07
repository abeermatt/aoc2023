import XCTest

final class EnergisedTests: XCTestCase {

    func testMarkingAsVisited() throws {
        var energised = Day16.Energised(size: 4)
        energised.markVisited(.init(coordinate: .init(x: 0, y: 0), direction: .up))
        energised.markVisited(.init(coordinate: .init(x: 3, y: 2), direction: .up))
        energised.markVisited(.init(coordinate: .init(x: 5, y: 5), direction: .up))
        XCTAssertEqual(energised.description,
        """
        #...
        ....
        ...#
        ....
        """)
    }
    
    func testMarkingAsVisitedWithDifferentDirections() throws {
        var energised = Day16.Energised(size: 4)
        energised.markVisited(.init(coordinate: .init(x: 0, y: 0), direction: .up))
        energised.markVisited(.init(coordinate: .init(x: 0, y: 0), direction: .down))
        XCTAssertTrue(energised.isVisited(.init(coordinate: .init(x: 0, y: 0), direction: .up)))
        XCTAssertTrue(energised.isVisited(.init(coordinate: .init(x: 0, y: 0), direction: .down)))
    }


    func testVisitCount() throws {
        var energised = Day16.Energised(size: 4)
        energised.markVisited(.init(coordinate: .init(x: 0, y: 0), direction: .up))
        energised.markVisited(.init(coordinate: .init(x: 3, y: 2), direction: .up))
        energised.markVisited(.init(coordinate: .init(x: 5, y: 5), direction: .up))
        XCTAssertEqual(energised.count, 2)
    }

    func testDescription() throws {
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
        var grid = Day16.Grid.parse(input)
        grid.visit()
        XCTAssertEqual(grid.energised.description, """
######....
.#...#....
.#...#####
.#...##...
.#...##...
.#...##...
.#..####..
########..
.#######..
.#...#.#..
""")
    }

}
