import Foundation

extension Day13 {
    enum Reflection: Equatable {
        case horizontal(Int)
        case vertical(Int)
    }
        
    struct Terrain {
        
        let lines: [String]
        
        func reflections() -> [Reflection] {
            
            return []
        }
        
        static func detectHorizontalReflection(inInput lines: [String]) -> Set<Int> {
            let first = lines.first!
            var columns = detectHorizontalReflection(inLine: first)
            
            for line in lines {
                var mutable = columns
                
                for column in columns {
                    if !hasReflection(inLine: line, atOffset: column) {
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
        
        
        static func detectHorizontalReflection(inLine line: String) -> Set<Int> {
            var matches = Set<Int>()
            
            for i in 1..<line.count {
                if hasHorizontalReflection(inLine: line, atColumn: i) {
                    matches.insert(i)
                }
            }
            
            return matches
            
        }
        
        static func hasHorizontalReflection(inLine line: String, atColumn column: Int) -> Bool {
            if column == 0 || column >= line.count - 1 {
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
        
//        static func rangesForReflection(inLine line: String, atColumn column: Int) -> (Range<String.Index>, Range<String.Index>) {
//            
//        }

        
        static func hasReflection(inLine line: String, atOffset offset: Int) -> Bool {
            let start = line.startIndex
            let middle = line.index(line.startIndex, offsetBy: offset)
            let end = line.index(middle, offsetBy: offset, limitedBy: line.endIndex) ?? line.endIndex
            
            let length = min(offset, line.count - offset)
            let left = String(line[start..<middle]).suffix(length)
            let right = String(line[middle..<end].reversed()).prefix(length)
            
//            print("left: \(left) right: \(right)")
            
            
            return left == right
        }
                
        static func parse(_ input: String) -> Self {
            return .init(lines: [])
        }
        
    }
}
