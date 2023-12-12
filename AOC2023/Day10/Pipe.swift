import Foundation

extension Day10 {
        
    
    enum Pipe: Character, Equatable, CaseIterable {
        
        case northSouth = "|" // vertical pipe connecting north and south.
        case eastWest = "-" // horizontal pipe connecting east and west.
        case northEast = "L" // 90-degree bend connecting north and east.
        case northWest = "J"  //90-degree bend connecting north and west.
        case southWest = "7"  // 90-degree bend connecting south and west.
        case southEast = "F" // 90-degree bend connecting south and east.
        case ground = "." // ground; there is no pipe in this tile.
        case start = "S" // starting position of the animal; there is a pipe on this tile, but your sketch doesn't show what shape the pipe has
                
        func endDirection(fromStart start: Direction) -> Direction? {
            switch (self, start) {
            case (.start, _): return nil
            default:
                var copy = directions
                copy.remove(start)
                return copy == directions ? nil : copy.first
            }
        }
        
        func connect(from: Direction) -> Direction? {
            var copy = directions
            copy.remove(from)
            return copy == directions ? nil : copy.first
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
