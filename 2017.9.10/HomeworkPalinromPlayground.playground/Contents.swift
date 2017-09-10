//: Playground - noun: a place where people can play

import UIKit

var arr2 : [Int] = [1,2,3,2,1]
arr2.popLast()
arr2.remove(at: 0)
arr2
//let arr3 = arr2[1...3]



func isPalindrom(_ arr : [Int]) -> Bool{
    
    if arr.count < 2{
        //an empty arr , or single item array is palindrom
        return true
    }
    
    //check edges
    var arr = arr
    if arr.remove(at: 0) != arr.popLast(){
        return false
    }
    
    return isPalindrom(arr)
    
//    if arr[0] == arr[arr.count - 1]{
//        
//    }
    
//    if arr.first != arr.last{
//        return false
//    }
    
    
    
}


isPalindrom([1,2,3,4,3,2,1])
isPalindrom([])
isPalindrom([0])
isPalindrom([-1,-1])
isPalindrom([-1,0,1])



