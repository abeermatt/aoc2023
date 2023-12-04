import Foundation

extension Day3 {

    struct PartNumber: Equatable {
        let x: Int
        let y: Int
        let value: Int
        private let xRange: ClosedRange<Int>
        private let yRange: ClosedRange<Int>
        
        init(x: Int, y: Int, value: Int) {
            self.x = x
            self.y = y
            self.value = value
            self.xRange = Self.calculateXRange(x: x, value: value)
            self.yRange = Self.calculateYRange(y: y)
        }
        
        private static func calculateXRange(x: Int, value: Int) -> ClosedRange<Int> {
            let lowerX = x - 1
            let upperX = x + value.digits()
            return ClosedRange(uncheckedBounds: (lowerX, upperX))
        }

        private static func calculateYRange(y: Int) -> ClosedRange<Int> {
            let lowerY = y - 1
            let upperY = y + 1
            return ClosedRange(uncheckedBounds: (lowerY, upperY))
        }

        func touching(symbol: Symbol) -> Bool {
            return self.xRange.contains(symbol.x) && self.yRange.contains(symbol.y)
        }
        
    }

}

