import Foundation


struct Graph {
    
    let vertices: [Coordinate: Vertex]
    var distances: [Vertex: Int]
    var visited: Set<Vertex> = []
    
    init(weights: [[Int]]) {
        let verticies = weights.enumerated().map { (rowIndex, row) in
            return row.enumerated().map { (columnIndex, weight) in
                return Vertex(coordinate: .init(x: columnIndex, y: rowIndex), weight: weight)
            }
        }.flatten().map { v in  (v.coordinate, v)}
        self.vertices = Dictionary(uniqueKeysWithValues: verticies)
        self.distances = Dictionary(uniqueKeysWithValues: vertices.values.map { v in (v, Int.max)})

    }
        
    mutating func visit() {
        let first = vertices[.init(x: 0, y: 0)]!
        distances[first] = 0
        
        while let next = candidate() {
            
            visited.insert(next)
            
            let distanceToNext = distance(to: next)
            
            for neighbour in neighbours(of: next) {
                let distanceToNeighbour = distance(to: neighbour)
                distances[neighbour] = min(distanceToNext + neighbour.weight, distanceToNeighbour)
            }
            
        }
        print(distances)
    }
    
    func distance(to vertex: Vertex) -> Int {
        return distances[vertex]!
    }
    
    func neighbours(of vertex: Vertex) -> [Vertex] {
        return [
            Coordinate(x: vertex.coordinate.x - 1, y: vertex.coordinate.y),
            Coordinate(x: vertex.coordinate.x + 1, y: vertex.coordinate.y),
            Coordinate(x: vertex.coordinate.x, y: vertex.coordinate.y - 1),
            Coordinate(x: vertex.coordinate.x, y: vertex.coordinate.y + 1)
        ].compactMap { coordinate in vertices[coordinate] }
    }
    
    func candidate() -> Vertex? {
        return distances
            .reject { (k1, v1) in v1 == Int.max }
            .sorted(by: { (pair1, pair2) in
                let (_, v1) = pair1
                let (_, v2) = pair2
                return v1 < v2
            })
            .first(where: { key, value in
                return !visited.contains(key)
            })?.key
    }
    
    
}

struct Coordinate: Hashable {
    let x: Int
    let y: Int
}


struct Vertex: Hashable {
    let coordinate: Coordinate
    let weight: Int
}


struct Dijkstra {
    typealias Input = [[Int]]
    
    var graph: Graph
    
    init(input: Input) {
        self.graph = .init(weights: input)
    }
    
    mutating func start() {
        graph.visit()
    }
    
    
}
