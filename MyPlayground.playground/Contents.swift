import UIKit

func fibonacci(n:Int){
    var array:[Int] = [0,1]
    var i = 0
    while i < n-2 {
        var fib = array[i] + array[i+1]
        array.append(fib)
        i += 1
    }
    print(array)
}
fibonacci(n: 5)
