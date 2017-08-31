//: Playground - noun: a place where people can play

import UIKit
/*
let str = "asdadasd a"
for ch in str.characters{
    
}
*/
let arr : [String] = [
    "AaeEiאo😇",
    "0123456",
    "tt,uoi",
    "chalisI"
]

//let vowels = "aeiouAEIOU"

extension Character{
    func isVowel() -> Bool{
        switch self {
        case "a","e","i","o","u":
            return true
        case "A","E","I","O","U":
            return true
        default:
            return false
        }
    }
}

var count = 0
for st in arr{
    for c in st.characters{
        if c.isVowel(){
            count += 1
        }
//        switch c {
//        case "a","e","i","o","u":
//            count += 1
//        case "A","E","I","O","U":
//            count += 1
//        default:
//            break
//        }
        
        /*
        if vowels.characters.contains(c){
            count += 1
        }*/
    }
}

count















