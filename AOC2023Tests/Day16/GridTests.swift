import XCTest

final class GridTests: XCTestCase {


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
        let grid = Day16.Grid.parse(input)
        XCTAssertEqual(grid.description, input)
    }

    func testVisitEmptySpace() throws {
        let input = """
        ..
        ..
        """
        var grid = Day16.Grid.parse(input)
        grid.visit()
        XCTAssertEqual(grid.energised.description, """
        ##
        ..
        """)
    }
        
    func testVisitBackwardMirror() throws {
        let input = #"""
        \.
        \\
        """#
        var grid = Day16.Grid.parse(input)
        grid.visit()
        XCTAssertEqual(grid.energised.description, """
        #.
        ##
        """)
    }
    
    func testVisitForwardMirror1() throws {
        let input = #"""
        /.
        ..
        """#
        var grid = Day16.Grid.parse(input)
        grid.visit()
        XCTAssertEqual(grid.energised.description, """
        #.
        ..
        """)
    }

    func testVisitForwardMirror2() throws {
        let input = #"""
        \.
        /.
        """#
        var grid = Day16.Grid.parse(input)
        grid.visit()
        XCTAssertEqual(grid.energised.description, """
        #.
        #.
        """)
    }
    
    func testVisitHorizontalSplitter() throws {
        let input = #"""
        .\.
        ...
        .-.
        """#
        var grid = Day16.Grid.parse(input)
        grid.visit()
        XCTAssertEqual(grid.energised.description, """
        ##.
        .#.
        ###
        """)
    }
    
    func testVisitVerticalSplitter() throws {
        let input = #"""
        \..
        \|.
        ...
        """#
        var grid = Day16.Grid.parse(input)
        grid.visit()
        XCTAssertEqual(grid.energised.description, """
        ##.
        ##.
        .#.
        """)
    }



}
