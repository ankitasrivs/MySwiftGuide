import UIKit

var str = "Hello, playground"
func staircase(n: Int) -> Void {
    for i in 1...n
    {
        print(String.init(repeating: " ", count: n-i)+String.init(repeating: "#", count: i))
    }
    
}

staircase(n: 4)
