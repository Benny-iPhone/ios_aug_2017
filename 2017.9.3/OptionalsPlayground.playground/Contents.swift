//: Playground - noun: a place where people can play

import UIKit

var str = "42"

var arr : [Int]? = [1,2,3]

var num : Int? = Int(str)

if num != nil{
    num! += 1
}

num

if arr != nil{
    arr!.append(4)
}

arr?.append(5)
arr

var count : Int? = arr?.count
count? += 2

let str1 = "8257"

let n2 = Int(str1)
if n2 != nil{
    print(n2!)
} else {
    print("no integer value found")
}

if let n3 = Int(str1){
    print(n3)
} else {
    print("no value")
}

let st1 = "1"
let st2 = "2"

if let a = Int(st1), let b = Int(st2), a > 0, b > 0{
    print(a + b)
} else {
    print("not good")
}

let c : Character = "3"
Int("\(c)")

String(32663, radix: 16)

func sumBinary(of number : Int) -> Int{
    let hexStr = String(number, radix: 16)
    
    var sum = 0
    
    for ch in hexStr.characters{
        if let n = Int("\(ch)"){
            sum += n
        }
    }
    
    return sum
}

sumBinary(of: 104030)


func targilMuzar💩(_ crap : String?) -> Int?{
    if let crap = crap{
        
        let crapArr : [String] = crap.components(separatedBy: ",")
        if let firstStr = crapArr.first,
            let lastStr = crapArr.last,
            let d1 = Int(firstStr),
            let d2 = Int(lastStr){
            return d1 + d2
        } else {
            return nil
        }
        
        
    } else {
        return nil
    }
}

targilMuzar💩(nil)
targilMuzar💩("")
targilMuzar💩("5")
targilMuzar💩("4,kjgmnma,b,2")

let myStr : String? = nil
let myNum = Int(myStr ?? "")

let arr2 = myStr?.components(separatedBy: ";") ?? []

















