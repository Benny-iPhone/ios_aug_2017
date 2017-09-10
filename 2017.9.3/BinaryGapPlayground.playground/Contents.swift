//: Playground - noun: a place where people can play

import UIKit

let num = 380
let str = "00000000" + String(num, radix: 2)

var counter = 0
var maxCounter = 0
var didStart = false

for value in str.characters{
    if value == "0"{
        
        if didStart{
            counter += 1
        }
        
    } else if value == "1"{
        didStart = true
        maxCounter = max(maxCounter, counter)
        counter = 0
    }
    
}

maxCounter

/*
func sumTwoNumber(num n1 : Int, num2 n2 : Int) -> Int{
    return n1 + n2
}

sumTwoNumber(num: 4, num2: 5)
*/










