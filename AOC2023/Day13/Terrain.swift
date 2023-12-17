import Foundation

extension Day13 {
    enum Reflection: Equatable {
        case horizontal(Int)
        case vertical(Int)
    }
    
    struct Notes {
        let terrains: [Terrain]
        
        func sum() -> Int {
            return terrains.reduce(0) { acc, next in
                let vertical = next.verticalReflections()
                let horizontal = next.horizontalReflections()
                
                return acc + vertical.sum() + (horizontal.sum() * 100)
            }
        }

        
        static func parse(_ input: String) -> Self {
            let groups = input.split(separator: /\n\n/)
            let terrains = groups.map {
                Terrain.parse(String($0))
            }
            return .init(terrains: terrains)
        }
    }
        
    struct Terrain {
        
        let lines: [String]
        
        func verticalReflections() -> Set<Int> {
            return Self.detectVerticalReflection(inInput: lines)
        }
        
        func horizontalReflections() -> Set<Int> {
            return Self.detectHorizontalReflection(inInput: lines)
        }
        
        static func detectHorizontalReflection(inInput lines: [String]) -> Set<Int> {
            var reflections = Set<Int>()
            
            for row in 0..<lines.count {
                if hasHorizontalReflection(inLines: lines, atRow: row) {
                    reflections.insert(row)
                }
            }
            return reflections

        }
        
        static func hasHorizontalReflection(inLines lines: [String], atRow row: Int) -> Bool {
//            print("### row \(row)")
//            print("lines \(lines)")

            if row == 0 || row > lines.count - 1 {
                return false
            }
            
            let distanceFromStart = row
            let distanceFromEnd = (lines.count - row)
            let offset = max(distanceFromStart - distanceFromEnd, 0)
            
//            print("distanceFromStart \(distanceFromStart) distanceFromEnd: \(distanceFromEnd) lines.count \(lines.count) offset: \(offset)")

            let start = lines.index(lines.startIndex, offsetBy: offset)
            let middle = lines.index(lines.startIndex, offsetBy: row, limitedBy: lines.endIndex) ?? lines.endIndex
            let end = lines.index(middle, offsetBy: row, limitedBy: lines.endIndex) ?? lines.endIndex

//            print("offset \(offset) start: \(start) middle: \(middle) end: \(end)")
            
            let leftRange = start..<middle
            let rightRange = middle..<end

            let left = lines[leftRange]
            let right = lines[rightRange].reversed()
            
//            print("left: \(left) right: \(right)")
            
            return Array(left) == Array(right)
        }
        
        static func detectVerticalReflection(inInput lines: [String]) -> Set<Int> {
            let first = lines.first!
            var columns = detectVerticalReflection(inLine: first)
            
            for line in lines {
                var mutable = columns
                
                for column in columns {
                    if !hasVerticalReflection(inLine: line, atColumn: column) {
                        mutable.remove(column)
                    }
                }
                columns.formIntersection(mutable)
                if columns.isEmpty {
                    break
                }

            }
            return columns
        }
        
        
        static func detectVerticalReflection(inLine line: String) -> Set<Int> {
            var matches = Set<Int>()
            
            for i in 1..<line.count {
                if hasVerticalReflection(inLine: line, atColumn: i) {
                    matches.insert(i)
                }
            }
            
            return matches
            
        }
        
        static func hasVerticalReflection(inLine line: String, atColumn column: Int) -> Bool {
            if column == 0 || column > line.count - 1 {
                return false
            }
//            print("### column \(column)")
            
            let distanceFromStart = column
            let distanceFromEnd = (line.count - column)
            let offset = max(distanceFromStart - distanceFromEnd, 0)
            
//            print("distanceFromStart \(distanceFromStart) distanceFromEnd: \(distanceFromEnd) line.count \(line.count) offset: \(offset) size \(size)")

            let start = line.index(line.startIndex, offsetBy: offset)
            let middle = line.index(line.startIndex, offsetBy: column, limitedBy: line.endIndex) ?? line.endIndex
            
            let end = line.index(middle, offsetBy: column, limitedBy: line.endIndex) ?? line.endIndex

//            print("offset \(offset) start: \(start) middle: \(middle) end: \(end)")
            
            let leftRange = start..<middle
            let rightRange = middle..<end

            let left = String(line[leftRange])
            let right = String(line[rightRange].reversed())
            
//            print("left: \(left) right: \(right)")
            
            return left == right
        }
        
        static func parse(_ input: String) -> Self {
            return .init(lines: input.splitByNewlines())
        }
        
    }
}

extension StringProtocol {
    
    func splitByNewlines() -> [String] {
        return self.components(separatedBy: .newlines).reject(\.isEmpty)
    }
}

