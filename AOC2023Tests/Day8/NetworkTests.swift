import XCTest

final class NetworkTests: XCTestCase {

    let input = """
AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ)
"""
    
    func testParsing() throws {
        let network = Day8.Network.parse(input)
        XCTAssertEqual(7, network.nodes.count)
        
        let found = network.node(named: "GGG")
        XCTAssertEqual(found, Day8.Node(id: "GGG", left: "GGG", right: "GGG"))
    }

}
