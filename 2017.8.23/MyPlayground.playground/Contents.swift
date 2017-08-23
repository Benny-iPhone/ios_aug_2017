//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var number = 10
number += 5
//number = 3.5
let number2 = 10
//number2 = 9
var result = number + number2


let num0 : Int

let num1 = 3
let num2 : Int = 3
let num3 : Int = 10_000_000

num0 = 5

let num💩💩💩 = 7
let r = 8 + num💩💩💩

let קבוע = 9
r * קבוע

var n1 : Int8 = 100
n1 += 1
n1 += 26
//n1 += 1 => error

var c : UInt = 0
let d = 4.5

let d2 = d + Double(n1)

Int(d)

let b1 : Bool = true
let b2 = false

let arr1 : Array<Int> = [1,2,3,4,3,2,1,4,4,80,80]
let arr : [Int] = [1,2,3,4,3,2,1,4,4,80,80]

let arr2 = arr.flatMap{ $0 + 1 }

arr.flatMap { (nnn : Int) -> Int in
    return nnn + 1
}

arr.sorted { $1 > $0 }
//arr.sort(by: <#T##(Int, Int) -> Bool#>)
arr2
arr.count
//arr.so

var single : Int = 0

for value in arr{
    single ^= value
}

single

var sum = 0
for i in 0..<arr.count{
    sum += arr[i]
}

sum

if sum > 100{
    
} else {
    
}

let x = 53
x % 7 == 0
print(x)
for i in 0...10{
    
}

























