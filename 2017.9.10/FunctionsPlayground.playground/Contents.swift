//: Playground - noun: a place where people can play

import UIKit

func doNothing(){
    
}

doNothing()

let f : ()->Void = doNothing
f()

//let num : Int = 4

func findTheMeaningOfTheWorld(_ callback : @escaping (Int)->Void){
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 4) { 
        callback(42)
    }
    
}

func handler(_ n : Int){
    print(Date())
    print(n)
}

print(Date())
findTheMeaningOfTheWorld(handler)



func doSomething(){
    print("doing something")
    print(#function)
}


doSomething()

func sayHello(name : String){
    print("hello" + " " + name)
    print(#function)
}

sayHello(name: "shani")


func sayHello(to name : String){
    print("hello" + " " + name)
    print(#function)
}

sayHello(to: "Avi")

func sayHello(_ name: String, _ prefix : String){
    print(prefix + " " + name)
}

sayHello("David", "Boker")

let aaa : [Int] = []
let aaaa : Array<Int> = []

func findMyIndex(_ arr : [Int], number num : Int) -> Int?{
    
    for i in 0..<arr.count{
        if arr[i] == num{
            return i
        }
    }
    
    return nil
    
}

findMyIndex([1,2,3,4,5,6,7], number: 30)
findMyIndex([1,2,3,4,5,6,7], number: 3)

func solution(_ dArr : [Double]) -> [Double]{
    var arr2 : [Double] = []
    
    for d in dArr{
        arr2.append(sqrt(d))
    }
    
    return arr2
}

solution([1,4,9,16,25,36,49])


let wtf = [1,4,9,16,25,36,49].flatMap{sqrt($0)}
print(wtf)

let myArr = [2,4,6,8]

myArr.flatMap { (nn : Int) -> Int in
    return nn * 2
}

myArr.flatMap { $0 * 3}

let strs = ["1","2","a"]
let r = strs.flatMap{Int($0)}
r


let myArr1 = [5,1,8,10,0]
print(myArr1.sorted { $0 < $1})
myArr1.sorted(by: >)














