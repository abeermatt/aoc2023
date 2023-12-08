import Foundation

extension Day8 {
    
    enum Direction: Character {
        case left = "L"
        case right = "R"
        
    }
    
    struct Instructions {
        private let line: String
        private var index: String.Index
        
        var direction: Direction {
            return Direction(rawValue: line[index])!
        }
        
        mutating func bump() {
            index = line.index(after: index)
            if index == line.endIndex {
                index = line.startIndex
            }
        }
        
        static func parse(_ line: String) -> Self {
            return .init(line: line, index: line.startIndex)
        }
    }
    
    struct Network {
        
        let nodes: [String: Node]
        
        func walk2(withInstructions instructions: Instructions) async -> Int {
            let starts = nodes.filter {  $0.key.hasSuffix("A") }
            
            
            let counts = await starts.parallelMap { (_, start) in
                let count = walk(withInstructions: instructions, startingAt: start, endingByMatching: { $0.id.hasSuffix("Z") })
                return count

            }
            return LeastCommonMultiplerCalculator().lcm(forNumbers: counts)
            
        }
        
        
        func walk(withInstructions instructions: Instructions, startingAt startNode: Node, endingByMatching match: (Node) -> Bool) -> Int {
            var count = 0
            var node = startNode
            var mutable = instructions
            
            while (match(node) == false) {
                let nextId = node.next(mutable.direction)
                node = nodes[nextId]!
                mutable.bump()
                count+=1
            }
            return count

        }
        
        func walk(withInstructions instructions: Instructions) -> Int {
            return walk(withInstructions: instructions, startingAt: nodes["AAA"]!, endingByMatching: { $0.id == "ZZZ" })
        }
                
        func node(named name: String) -> Node {
            return nodes[name]!
        }
        
        static func from(_ lines: [String]) -> Self {
            let nodes = lines
                .reject(\.isEmpty)
                .map(Node.parse(_:))
                .reduce(into: [:]) { acc, next in
                    acc[next.id] = next
                }

            return .init(nodes: nodes)

        }
        
        static func parse(_ input: String) -> Self {
            return from(input.components(separatedBy: .newlines))
        }
    }
    
    struct Node: Hashable {
        let id: String
        let left: String
        let right: String
        
        func next(_ direction: Direction) -> String {
            switch direction {
            case .left: return left
            case .right: return right
            }
        }
                
        static let regex = /(\w+) = \((\w+), (\w+)\)/
        
        static func parse(_ input: String) -> Self {
            let match = try! regex.firstMatch(in: input)!
            let (_, id, left, right) = match.output
            
            return .init(id: String(id), left: String(left), right: String(right))
        }
    }
}
