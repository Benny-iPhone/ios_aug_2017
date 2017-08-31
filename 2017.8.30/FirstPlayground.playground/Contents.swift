//: Playground - noun: a place where people can play

import UIKit

var str : String = "Hello, playground"

var num1 = 1
let num2 = 2
//num2 += num1
num1 += num2

if num1 + num2 == num2 + num1{
    
} else {
    
}

var sum = 0

for x in 1...10{
    sum += x
}

sum

let t = 1_000
let num3 = Double.pi
let sum1 = Double(t) + num3

let str1 = String()

/*
 * Pitagoras
 */
let a : Double = 3
let b : Double = 4
let c : Double = 5

if c * c == a * a + b * b{
    print("pita")
}

if sqrt(pow(a, 2) + pow(b, 2)) == c {
    print("pita")
}


let arr : [Int] = [-50,0,50]

var maxNum : Int = arr[0]
for value in arr{
    maxNum = max(maxNum, value)
    /*
    if value > maxNum{
        maxNum = value
    }*/
}

maxNum

let c1 : Character = "a"
let c2 : Character = "\u{1f496}"

var s1 = "hello"
var s2 = "world"
s1 + " " + s2 + "max num is:\(maxNum)"

"\(1 == 1)"

a.description

let s3 = String(format: "pi is : %.3f", Double.pi)

s3.isEmpty
s3.characters.count

for ch in s3.characters{
    if ch == " "{
        print("space")
    }
}






















