import Foundation

extension Day5 {
    struct MRange {
        
        let sourceRange: Range<Int>
        let difference: Int
        
        var destinationRange: Range<Int> {
            let lower = sourceRange.lowerBound + difference
            let upper = sourceRange.upperBound + difference
            return lower..<upper
        }
        
        func getDestination(forSource source: Int) -> Int? {
            if sourceRange.contains(source) {
                return source + difference
            }
            return nil
        }
                
        static func fromInput(_ input: String) -> Self {
            let values = input.components(separatedBy: " ")
            let destinationRangeStart = Int(values[0])!
            let sourceRangeStart = Int(values[1])!
            let rangeLength = Int(values[2])!
            let sourceRangeEnd = sourceRangeStart + rangeLength
            return MRange(sourceRange: sourceRangeStart..<sourceRangeEnd, difference: destinationRangeStart - sourceRangeStart)
        }
    }
    
}

