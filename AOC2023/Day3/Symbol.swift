import Foundation

extension Day3 {
    
    struct Symbol: Equatable {
        let x: Int
        let y: Int
        let isGearMultiplier: Bool
        
        init(x: Int, y: Int, value: Character) {
            self.x = x
            self.y = y
            self.isGearMultiplier = value == "*"
        }
    }
}
