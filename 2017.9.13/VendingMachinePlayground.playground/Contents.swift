//: Playground - noun: a place where people can play

import UIKit


/*
 100, 50, 25, 10, 5 , 1
 5.00
 0.99
 [4,0,0,0,0,1]
 */

func vendingMachine(cost : Double, amount : Double) -> [Int]
{
    let coins : [Int] = [100,50,25,10,5,1]
    var change = [Int](repeatElement(0, count: coins.count))

    guard cost < amount else {
        print("not enough money")
        return []
    }
    
    var sum = Int(amount * 100) - Int(cost * 100)
    
    for i in 0..<coins.count{
        let c = coins[i]
        change[i] = sum / c
        
        sum = sum % c
    }
    
    return change
    
}

vendingMachine(cost: 0.99, amount: 5.00)
/*
func validateEmail(_ email : String?) -> Bool{
    if email == nil{
        return
    }
 
    //email stays optional
    
    if let email = email{
        if email.isEmpty == false{
            //all code is nested, ugly :(
        }
    }
    
    guard let email = email else {
        return false
    }
    
    guard !email.isEmpty else{
        return false
    }
    
    //
    
}



func checkCode(_ data : Data?) -> Bool{
    guard let data = data else{
        print("no data")
        return false
    }
    
    guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) else{
        print("data is not json")
        return false
    }
    
    guard let dict = json as? [String:Any] else {
        print("json is not dictionary")
        return
    }
    
    guard let code = dict["code"] as? Int else {
        print("no code found")
        return false
    }
    
    return code >= 200 && code <= 299
}

*/











