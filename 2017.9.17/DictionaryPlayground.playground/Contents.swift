//: Playground - noun: a place where people can play

import UIKit

let ages1 : Dictionary<String,Int> = [:]
let ages2 : [String:Int] = [:]


var ages3 = [
    "tal":26,
    "keren":25,
    "shani":24
]

let tal = ages3["tal"]

ages3["benny"] = 30

ages3

let benny = ages3["benny"]

ages3["benny"] = nil

ages3

ages3.removeValue(forKey: "keren")

ages3


let keys = Array(ages3.keys)
let values = Array(ages3.values)

let query : [String:Any] = [
    "AreaID":2,
    "ModelID":195,
    "FromYear":2015,
    "Info":"good engine"
]

//?key=value&key=value&key=value&key=value&key=value&

var queryString = "?"
for (key,val) in query{
    queryString += key + "=\(val)&"
    //queryString += key + "=" + (val as AnyObject).description! + "&"
}

queryString


for item in query{
    item.key
    item.value
}

let t1 = ("myStr",5,true)
t1.0

let t2 = (name: "queen", value: 12, shape: "spade")
t2.shape
t2.1

func floorAndCielOf(num : Double) -> (floor: Int, ciel: Int){
    return (0,0)
}

if query["Info"] is String{
    let info = query["Info"] as! String
}

if let year = query["FromYear"] as? Int{
    
}

let areaId = query["AreaID"] as? Int ?? 0


let userDict : [String:Any] = [
    "first_name":"shani",
    "last_name":"madar",
    "birthdate":733989600.0,
    "female":true
]

let birthdate = userDict["birthdate"] as? TimeInterval ?? 0
let date = Date(timeIntervalSince1970: birthdate)

let gregCal = Calendar(identifier: .gregorian)
gregCal.component(.weekday, from: date)


























