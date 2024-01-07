import Foundation

extension Day16 {
    
    struct Grid: CustomStringConvertible {
        
        let tiles: [[Tile]]
        let size: Int
        var energised: Energised
        
        var energisedCount: Int {
            return energised.count
        }
        
        init(tiles: [[Tile]]) {
            self.tiles = tiles
            self.size = tiles.count
            self.energised = .init(size: tiles.count)
        }
        
        mutating func visit() {
            let initial = Coordinate(x: -1, y: 0)

            var toVisit: [Spot] = nextSpots(forSpot: .init(coordinate: initial, direction: .right))
            
            while !toVisit.isEmpty {
                let nextToVisit = toVisit.flatMap(nextSpots(forSpot:))

                toVisit.forEach {
                    energised.markVisited($0)
                }
                

                toVisit.removeAll()
                toVisit.append(contentsOf: nextToVisit)
            }
        }
        
        func nextSpots(forSpot spot: Spot) -> [Spot] {
            let nextCoordinate = spot.coordinate.move(inDirection: spot.direction)
//            print("moveBeam from \(coordinate) inDirection \(direction) nextCoordinate \(nextCoordinate)")
            if isInBounds(nextCoordinate) && !energised.isVisited(spot) {

                let tile = tile(atCoordinate: nextCoordinate)
//                print("Moving Beam from \(coordinate) \(direction), tile: \(tile.rawValue)")
//                print(energised.description)

                let directions = tile.next(headingInDirection: spot.direction)
                return directions.map {
                    Spot(coordinate: nextCoordinate, direction: $0)
                }
            }
            return []

        }
        
        func tile(atCoordinate coordinate: Coordinate) -> Tile {
            let row = tiles[coordinate.y]
            return row[coordinate.x]
        }
                
        func isInBounds(_ coordinate: Coordinate) -> Bool {
            return coordinate.y >= 0  && coordinate.y < tiles.count
            && coordinate.x >= 0 && coordinate.x < tiles[coordinate.y].count
        }
        
        var description: String {
            return tiles.map { row in
                return row.map { String($0.rawValue) }.joined()
            }.joined(separator: "\n")
        }
        
        static func parse(_ input: String) -> Self {
            let tiles = input
                .components(separatedBy: .newlines)
                .map { line in
                    return line.map { Tile(rawValue: $0)! }
                }
            
            return .init(tiles: tiles)
        }


    }
    
    struct Spot: Hashable {
        let coordinate: Coordinate
        let direction: Direction
    }

    
    enum Tile: Character {
        case emptySpace = "."
        case forwardMirror = "/"
        case backwardMirror = #"\"#
        case verticalSplitter = "|"
        case horizontalSplitter = "-"
        
        func next(headingInDirection direction: Direction) -> [Direction] {
            switch (self, direction) {
            case (.emptySpace, _): return [direction]
            case (.forwardMirror, .left): return [.down]
            case (.forwardMirror, .right): return [.up]
            case (.forwardMirror, .up): return [.right]
            case (.forwardMirror, .down): return [.left]
            case (.backwardMirror, .left): return [.up]
            case (.backwardMirror, .right): return [.down]
            case (.backwardMirror, .up): return [.left]
            case (.backwardMirror, .down): return [.right]
            case (.verticalSplitter, .up): return [direction]
            case (.verticalSplitter, .down): return [direction]
            case (.verticalSplitter, _): return [.up, .down]
            case (.horizontalSplitter, .left): return [direction]
            case (.horizontalSplitter, .right): return [direction]
            case (.horizontalSplitter, _): return [.left, .right]
            }
        }
    }
    
    enum Direction {
        case up
        case down
        case left
        case right
        
    }


    struct Energised: CustomStringConvertible {
        let size: Int
        var states: Set<Spot> = []
        
        struct State: Hashable {
            let coordinate: Coordinate
            let direction: Direction
        }

        mutating func markVisited(_ spot: Spot) {
            if spot.coordinate.x < size && spot.coordinate.y < size {
                states.insert(spot)
            }
        }

        var count: Int {
            return coordinates.count
        }
        
        var coordinates: Set<Coordinate> {
            return Set(states.map(\.coordinate))
        }
        
        func isVisited(_ spot: Spot) -> Bool {
            return states.contains(spot)
        }
        
        var description: String {
            return (0..<size).map { y in
                return (0..<size).map { x in
                    let coordinate = Coordinate(x: x, y: y)
                    if coordinates.contains(coordinate) {
                        return "#"
                    }
                    return "."
                }.joined()
            }.joined(separator: "\n")
        }
        
    }

    struct Coordinate: Hashable {
        let x: Int
        let y: Int
        
        func move(inDirection direction: Direction) -> Self {
            switch direction {
            case .up: return .init(x: x, y: y - 1)
            case .down: return .init(x: x, y: y + 1)
            case .left: return .init(x: x - 1, y: y)
            case .right: return .init(x: x + 1, y: y)
            }
        }

    }

}
