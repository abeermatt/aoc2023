import Foundation

extension Day9 {
        
    struct History {
        
        let values: [Int]
        
        func nextValue() -> Int {
            if values.areAllTheSame() {
                return values.first!
            }

            let next = History(values: values.stepDifferences()).nextValue()
            
            return values.last! + next
            
        }
        
        func previousValue() -> Int {
            if values.areAllTheSame() {
                return values.first!
            }
            let previous = History(values: values.stepDifferences()).previousValue()

            return values.first! - previous
        }
                
        static func parse(_ input: String) -> Self {
            let values = input.components(separatedBy: .whitespaces).compactMap(Int.init)
            return History(values: values)
        }
    }
}

