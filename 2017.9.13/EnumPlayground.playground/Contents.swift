//: Playground - noun: a place where people can play

import UIKit

enum OperatingSystem{
    case iOS
    case macOS
    case watchOS, tvOS
    
    func something(){
        
    }
}

var os1 : OperatingSystem = OperatingSystem.macOS
os1.something()
os1 = .watchOS

let os2 : OperatingSystem = .tvOS

func sayOS(_ os : OperatingSystem) -> String{
    return String(describing: os)
}

sayOS(.iOS)
sayOS(os1)



enum Day : Int{
    case sunday = 1
    case monday
    case tuesday, wednesday, thursday
    case friday, saturday
    
    func name() -> String{
        switch self {
        case .sunday: return "יום ראשון 😞"
        case .monday: return "יום שני 😔"
        case .tuesday: return "יום שלישי 😳"
        case .wednesday: return "יום רביעי 😀📲"
        case .thursday: return "יום חמישי 🤡"
        case .friday: return "יום שישי 🍻"
        case .saturday: return "יום שבת 🕍🏖"
        }
    }
    
    var prev : Day{
        get{
            return Day(rawValue: self.rawValue - 1) ?? .saturday
        }
    }
    
    func prevDay() -> Day{
        return Day(rawValue: self.rawValue - 1) ?? .saturday
    }
    
    func nextDay() -> Day{
        return Day(rawValue: self.rawValue + 1) ?? .sunday
        /*
        if let d = Day(rawValue: self.rawValue + 1){
            return d
        } else {
            return .sunday
        }*/
    }
}

Day.sunday.rawValue
Day.monday.rawValue

let d1 : Day = .sunday
d1.rawValue

d1.nextDay().prevDay().prev


let d2 = Day(rawValue: 20)

d1.name()
Day(rawValue: 7)?.name()
d2?.name()






















