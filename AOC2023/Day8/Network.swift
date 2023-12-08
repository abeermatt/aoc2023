//
//  Network.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 08/12/2023.
//

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
            print("index \(index) direction \(direction)")
            
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
        let start = "AAA"
        let finish = "ZZZ"
        
        func walk(withInstructions instructions: Instructions) -> Int {
            var node = nodes[start]!
            var count = 0
            
            var mutable = instructions
            
            while (node.id != finish) {
                let nextId = node.next(mutable.direction)
                node = nodes[nextId]!
                mutable.bump()
                count+=1
            }
            return count
        }
        
        private func walk(instructions: Instructions, node: Node, count: Int) -> Int {
            if node.id == finish {
                return count
            }
            let direction = instructions.direction
            let next = node.next(direction)
            let nextNode = nodes[next]!
            
            var mutable = instructions
            return walk(instructions: mutable.bump(), node: nextNode, count: count + 1)
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
        
//        func route(to: )
        
        static let regex = /(\w+) = \((\w+), (\w+)\)/
        
        static func parse(_ input: String) -> Self {
            let match = try! regex.firstMatch(in: input)!
            let (_, id, left, right) = match.output
            
            return .init(id: String(id), left: String(left), right: String(right))
        }
    }
}
