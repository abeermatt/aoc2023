import Foundation

extension Day10 {
        
    struct Landscape {
/*
-L|F7
7S-7|
L|7||
-L-J|
L|-JF
*/

        let tiles: [[Tile]]
        let start: Tile
        
        var width: Range<Int> {
            return 0..<tiles.count
        }
        var height: Range<Int> {
            return 0..<tiles.first!.count
        }

        init(tiles: [[Tile]]) {
            self.tiles = tiles
            self.start = Self.findStart(tiles)
        }
        
        private static func findStart(_ tiles: [[Tile]]) -> Tile {
            return tiles.compactMap { row in
                row.first(where: \.isStart)
            }.first!
        }
        
        func contains(_ coordinate: Coordinate) -> Bool {
            return width.contains(coordinate.x) && height.contains(coordinate.y)
        }
        
        func walk() -> [Tile] {
//            print("start \(start)")
            let candidates = start.pipe.directions.filter { direction in
//                print("direction \(direction)")
                let nextCoordinate = start.coordinate.move(inDirection: direction)
//                print("nextCoordinate \(nextCoordinate)")
                if let nextTile = self.tile(atCoordinate: nextCoordinate) {
                    let valid = start.pipe.canConnect(with: nextTile.pipe, fromDirection: direction.opposite)
//                    print("nextTile \(nextTile), valid \(valid)")
                    return valid
                }
                return false
            }
            
            var direction = candidates.first!
            var tile = start
            var tiles: [Tile] = []
            
            while tiles.isEmpty || !tile.isStart {
                let nextCoordinate = tile.coordinate.move(inDirection: direction)
                print("nextCoordinate \(nextCoordinate)")
                tile = self.tile(atCoordinate: nextCoordinate)!
                tiles.append(tile)
                if tile.isStart {
                    break
                }
                print("nextTile \(tile)")
                direction = tile.pipe.endDirection(fromStart:  direction.opposite)!
                print("nextDirection \(direction)")
            }
//            print("Found \(candidates.count) candidates")
//            assert(candidates.count == 2)
//            print("Using first \(first)")
//            let path = start.move(inLandscape: self, inDirection: first, tiles: [start])
//            print(path)
            return tiles
        }
        
        func furthest() -> Int {
            let tiles = walk()
            return tiles.count / 2
        }
        
        
        func tile(atCoordinate coordinate: Coordinate) -> Tile? {
            if contains(coordinate) {
                return tiles[coordinate.y][coordinate.x]
            }
            return nil
        }
                                
        static func parse(_ input: String) -> Self {
            let tiles = input
                .components(separatedBy: .newlines)
                .enumerated()
                .map { rowPair in
                    let (row, line) = rowPair
                    return line
                        .enumerated()
                        .map { columnPair in
                            let (col, char) = columnPair
                            return Tile(coordinate: .init(x: col, y: row), pipe: .init(rawValue: char)!)

                    }
                }
            return .init(tiles: tiles)
        }

    }
    
    struct Tile: Equatable {
        let coordinate: Coordinate
        let pipe: Pipe
        
        var isStart: Bool {
            return pipe == .start
        }
        
        func move(inLandscape landscape: Landscape, inDirection direction: Direction, tiles: [Tile]) -> [Tile] {
            if tiles.count > 1, let end = tiles.last, end.isStart {
                return tiles
            }
            let nextCoordinate = coordinate.move(inDirection: direction)
            print("nextCoordinate \(nextCoordinate)")
            let nextTile = landscape.tile(atCoordinate: nextCoordinate)!
            if nextTile.isStart {
                return tiles
            }
            print("nextTile \(nextTile)")
            let nextDirection = nextTile.pipe.endDirection(fromStart:  direction.opposite)!
            print("nextDirection \(nextDirection)")
            
            var copy = tiles
            copy.append(nextTile)
            return nextTile.move(inLandscape: landscape, inDirection: nextDirection, tiles: copy)
        }
                
        
    }
    
    struct Coordinate: Equatable {
        let x: Int
        let y: Int
        
    
        func move(inDirection direction: Direction) -> Self {
            
            switch direction {
            case .north: return .init(x: x, y: y - 1)
            case .south: return .init(x: x, y: y + 1)
            case .west: return .init(x: x - 1, y: y)
            case .east: return .init(x: x + 1, y: y)
            }

        }
    }
    
    enum Direction: CaseIterable {
        case north
        case south
        case west
        case east
        
        var opposite: Direction {
            switch self {
            case .north: return .south
            case .south: return .north
            case .west: return .east
            case .east: return .west
            }
        }
        
        func connects(to direction: Direction) -> Bool {
            return self.opposite == direction
        }
    }
        
    enum Pipe: Character, Equatable, CaseIterable {
        
        case northSouth = "|" // vertical pipe connecting north and south.
        case eastWest = "-" // horizontal pipe connecting east and west.
        case northEast = "L" // 90-degree bend connecting north and east.
        case northWest = "J"  //90-degree bend connecting north and west.
        case southWest = "7"  // 90-degree bend connecting south and west.
        case southEast = "F" // 90-degree bend connecting south and east.
        case ground = "." // ground; there is no pipe in this tile.
        case start = "S" // starting position of the animal; there is a pipe on this tile, but your sketch doesn't show what shape the pipe has
                
        func move(fromPosition position: Coordinate, inDirection direction: Direction) -> Coordinate {
            if self.directions.contains(direction) {
                return position.move(inDirection: direction)
            }
            return position
        }
        
        func endDirection(fromStart start: Direction) -> Direction? {
            switch (self, start) {
            case (.northSouth, .north): return .south
            case (.northSouth, .south): return .north
            case (.eastWest, .west): return .east
            case (.eastWest, .east): return .west
            case (.northEast, .north): return .east
            case (.northEast, .east): return .north
            case (.northWest, .north): return .west
            case (.northWest, .west): return .north
            case (.southWest, .south): return .west
            case (.southWest, .west): return .south
            case (.southEast, .south): return .east
            case (.southEast, .east): return .south
            default: return nil
            }
        }
                
        func canConnect(with pipe: Pipe, fromDirection direction: Direction) -> Bool {
            
            switch (self, direction) {
            case (.northSouth, .north): return [.northSouth, .northEast, .northWest].contains(pipe)
            case (.northSouth, .south): return [.northSouth, .southEast, .southWest].contains(pipe)
            case (.eastWest, .west): return [.eastWest, .northWest, .southWest].contains(pipe)
            case (.eastWest, .east): return [.eastWest, .northEast, .southEast].contains(pipe)
            case (.northEast, .north): return Self.eastWest.canConnect(with: pipe, fromDirection: .west)
            case (.northEast, .east): return Self.northSouth.canConnect(with: pipe, fromDirection: .south)
            case (.northWest, .north): return Self.eastWest.canConnect(with: pipe, fromDirection: .east)
            case (.northWest, .west): return Self.northSouth.canConnect(with: pipe, fromDirection: .south)
            case (.southWest, .south): return Self.eastWest.canConnect(with: pipe, fromDirection: .east)
            case (.southWest, .west): return Self.northSouth.canConnect(with: pipe, fromDirection: .north)
            case (.southEast, .south): return Self.eastWest.canConnect(with: pipe, fromDirection: .west)
            case (.southEast, .east): return Self.northSouth.canConnect(with: pipe, fromDirection: .north)
            case (.start, .north): return Self.northSouth.canConnect(with: pipe, fromDirection: .north)
            case (.start, .south): return Self.northSouth.canConnect(with: pipe, fromDirection: .south)
            case (.start, .east): return Self.eastWest.canConnect(with: pipe, fromDirection: .east)
            case (.start, .west): return Self.eastWest.canConnect(with: pipe, fromDirection: .west)
            default: return false
            }
        }
        
        
        
        
        var directions: Set<Direction> {
            switch self {
            case .northSouth: return [.north, .south]
            case .eastWest: return [.east, .west]
            case .northEast: return [.north, .east]
            case .northWest: return [.north, .west]
            case .southWest: return [.south, .west]
            case .southEast: return [.south, .east]
            case .start: return Set(Direction.allCases)
            default: return []
            }
        }
        
        
    }
}
