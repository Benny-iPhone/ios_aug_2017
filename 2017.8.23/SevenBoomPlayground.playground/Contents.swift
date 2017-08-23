//: Playground - noun: a place where people can play

import UIKit


var counter = 0

for i in 1...99{
    if i % 7 == 0{
        counter += 1
        continue
    }
    
    var num = i
    while num > 0{
        if num % 10 == 7{
            counter += 1
            num = 0
        }
        
        num /= 10
    }
}

counter





























