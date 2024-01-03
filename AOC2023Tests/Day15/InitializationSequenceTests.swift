import XCTest

final class InitializationSequenceTests: XCTestCase {

    func testApply() throws {
        var sequence = Day15.InitializationSequence()
        
        sequence.apply(operation: .equals("rn", 1))
        XCTAssertEqual(sequence.description, 
        """
        Box 0: [rn 1]
        """)

        sequence.apply(operation: .dash("cm"))
        XCTAssertEqual(sequence.description,
        """
        Box 0: [rn 1]
        """)

        sequence.apply(operation: .equals("qp", 3))
        XCTAssertEqual(sequence.description, 
        """
        Box 0: [rn 1]
        Box 1: [qp 3]
        """)

        sequence.apply(operation: .equals("cm", 2))
        XCTAssertEqual(sequence.description,
        """
        Box 0: [rn 1] [cm 2]
        Box 1: [qp 3]
        """)

        sequence.apply(operation: .dash("qp"))
        XCTAssertEqual(sequence.description,
        """
        Box 0: [rn 1] [cm 2]
        """)

        sequence.apply(operation: .equals("pc", 4))
        XCTAssertEqual(sequence.description,
        """
        Box 0: [rn 1] [cm 2]
        Box 3: [pc 4]
        """)

        sequence.apply(operation: .equals("ot", 9))
        XCTAssertEqual(sequence.description,
        """
        Box 0: [rn 1] [cm 2]
        Box 3: [pc 4] [ot 9]
        """)

        sequence.apply(operation: .equals("ab", 5))
        XCTAssertEqual(sequence.description,
        """
        Box 0: [rn 1] [cm 2]
        Box 3: [pc 4] [ot 9] [ab 5]
        """)

        sequence.apply(operation: .dash("pc"))
        XCTAssertEqual(sequence.description,
        """
        Box 0: [rn 1] [cm 2]
        Box 3: [ot 9] [ab 5]
        """)
        
        sequence.apply(operation: .equals("pc", 6))
        XCTAssertEqual(sequence.description,
        """
        Box 0: [rn 1] [cm 2]
        Box 3: [ot 9] [ab 5] [pc 6]
        """)

        sequence.apply(operation: .equals("ot", 7))
        XCTAssertEqual(sequence.description,
        """
        Box 0: [rn 1] [cm 2]
        Box 3: [ot 7] [ab 5] [pc 6]
        """)

    }

    func testFocussingPower() throws {
        let input = """
        rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7
        """

        let sequence = Day15.InitializationSequence.parse(input)
        XCTAssertEqual(sequence.focussingPower(of: "rn"), 1)
        XCTAssertEqual(sequence.focussingPower(of: "cm"), 4)
        XCTAssertEqual(sequence.focussingPower(of: "ot"), 28)
        XCTAssertEqual(sequence.focussingPower(of: "ab"), 40)
        XCTAssertEqual(sequence.focussingPower(of: "pc"), 72)

        XCTAssertEqual(sequence.totalFocussingPower(), 145)
    }

}
