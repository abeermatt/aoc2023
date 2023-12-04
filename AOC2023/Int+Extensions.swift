import Foundation

extension Int {

    func digits() -> Int {
        if self == 0 {
            return 1
        }
        if self < 0 {
            return (self * -1).digits(accumulator: 0)
        }
        return digits(accumulator: 0)
    }
    
    private func digits(accumulator: Int) -> Int {
        if self > 0 {
            return (self / 10).digits(accumulator: accumulator + 1)
        }
        return accumulator
    }
    
}
