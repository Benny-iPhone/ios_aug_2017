//: Playground - noun: a place where people can play

import UIKit

func move(arr : [Int], steps : Int) -> [Int]{
    
    let s = steps % arr.count
    var result : [Int] = [Int](repeatElement(0, count: arr.count))
    
    for i in 0..<arr.count{
        
        let k = (i + s) % arr.count
        result[k] = arr[i]
        print(result)
    }
    
    return result
}

move(arr: [1,2,3,4,5], steps: 8)

