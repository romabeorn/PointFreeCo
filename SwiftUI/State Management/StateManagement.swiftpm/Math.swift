import Foundation

enum Math {
    
    static func isPrime(number: Int) -> Bool {
        guard number > 1 else { return false }
        for i in 2..<number{
            if (number % i == 0){
                return false
            }
        }
        return true
    }
}
