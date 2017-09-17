//: Playground - noun: a place where people can play

import UIKit

class Animal{
    var name : String{
        didSet (oldName){
            print("name change from " + oldName + " to " + name)
        }
    }
    
    init(name : String) {
        self.name = name
    }
    
    init() {
        name = ""
    }
}

class Hippo : Animal{
    func dump(){
        print(name + " dumping, you know... 💩")
    }
    
    class func willAttack() -> Bool{
        return arc4random() % 2 == 0
    }
}

let hippo = Hippo()
hippo.name

let tomy = Hippo(name: "Tommy")
tomy.name
tomy.name = "My Hippo"

tomy.dump()

Hippo.willAttack()


class SQLManager{
    static let manager = SQLManager()
    
    //privating the init, will make the manager to singleton
    private init(){
        
    }
    
    func connectToDB() -> Bool{
        return true
    }
}

//let s = SQLManager()

SQLManager.manager.connectToDB()

class Node{
    var value : Int = 0
    
    lazy var parent : Node = Node()
    var right : Node?
    var left : Node?
}

let n = Node()
n.parent.parent.parent.value

class Person{
    //NOT GOOD, RECURSIVE
    //let father = Person()
    
    var father : Person?
    
}

let p = Person()
p.father


class Car{
    let name : String?
    let number : String
    let createDate : Date
    var kilometraz : Double
    //let price : Int
    
    init(_ dict : [String:Any]){
        self.name = dict["name"] as? String
        self.number = dict["plate"] as? String ?? ""
        self.kilometraz = dict["km"] as? Double ?? 0
     
        if let timestamp = dict["date"] as? Double{
            self.createDate = Date(timeIntervalSince1970: timestamp)
        } else {
            self.createDate = Date(timeIntervalSince1970: 0)
        }
        
    }
    
    init(name : String?, number : String, createDate : Date, kilo : Double) {
        self.name = name
        self.number = number
        self.createDate = createDate
        kilometraz = kilo
    }
}

let carDict : [String:Any] = [
    "plate":"AB123DFE",
    "date":1505008800.0,
    "km":400.7
]


let c1 = Car(name: nil, number: "12345678", createDate: Date(), kilo: 0)

























