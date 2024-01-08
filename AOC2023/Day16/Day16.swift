import Foundation
struct Day16 {
    struct Part1 {
        static func run(_ input: String) -> Int {
            var grid = Grid.parse(input)
            grid.visit()
            return grid.energisedCount
        }
             
    }
    
    struct Part2 {        
        static func run(_ input: String) -> Int {
            var grid = Grid.parse(input)
            
            let starts = (0..<grid.size).flatMap { v in
                return [
                    Spot(coordinate: .init(x: -1, y: v), direction: .right),
                    Spot(coordinate: .init(x: grid.size, y: v), direction: .left),
                    Spot(coordinate: .init(x: v, y: -1), direction: .down),
                    Spot(coordinate: .init(x: v, y: grid.size), direction: .up),
                ]
            }
            return starts.map { spot in
                grid.visit(startingAt: spot)
                return grid.energisedCount
            }.max()!
            
        }
    }
}
