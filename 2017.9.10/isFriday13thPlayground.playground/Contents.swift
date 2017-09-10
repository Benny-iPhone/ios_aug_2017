//: Playground - noun: a place where people can play

import UIKit


func isFriday13th(_ date : Date) -> Bool{
    //let calendar = Calendar.current
    //let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    let calendar = Calendar(identifier: .gregorian)
    
    let day = calendar.component(.day, from: date)
    let weekday = calendar.component(Calendar.Component.weekday, from: date)
    
    return day == 13 && weekday == 6
}

let now = Date()
isFriday13th(now)

let date1 = Date(timeIntervalSince1970: 1484326238)
isFriday13th(date1)


func change(num : inout Int){
    num += 1
}

var n1 = 4
change(num: &n1)
n1

//Write a func that receive 2 numbers and replace their values

func mySwap(_ a : inout Int, _ b : inout Int){
    //a = 3 , b = 5
    a = a + b
    //a = 8, b = 5
    b = a - b
    //a = 8, b = 3
    a = a - b
    //a = 5, b = 3
}

var n2 = 3
mySwap(&n1, &n2)
n2
n1















