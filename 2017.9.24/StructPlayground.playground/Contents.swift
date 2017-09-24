//: Playground - noun: a place where people can play

import UIKit

struct Point{
    var x : Double
    var y : Double
    
    func distance(from p : Point) -> Double{
        
        let a = self.x - p.x
        let b = self.y - p.y
        
        return sqrt(pow(a,2 ) + pow(b, 2))
        
    }
}

var p1 = Point(x: 1, y: 1)
let p2 = Point(x: 4, y: 5)
//p1.x = 4
class Person{
    var name = ""
}

let per1 = Person()
per1.name = "moshe"

var arr1 = [p1,p2]
var arr2 = [per1,Person()]

var arrrrr1 = arr1
var arrrrr2 = arr2

arrrrr1[0].x = -1
arr1[0].x

arrrrr2[0].name = "ירחמיאל"
arr2[0].name


var num1 = 1
var num2 = num1
num2 = 2







p1.distance(from: p2)

struct Circle{
    var center : Point
    var radius : Double
    
    mutating func moveRight(){
        var c = self.center
        c.x += 1
        self = Circle(center: c, radius: self.radius)
        self.center.x += 1
    }
}



let label1 = UILabel(frame: CGRect(x: 20, y: 20, width: 100, height: 40))

var rect = label1.frame
rect.origin.y += 80

//label1.frame.origin.y += 80
//label1.frame = rect

let label2 = UILabel(frame: rect)

func adjustColor(of label : UILabel){
    label.textColor = .red
}

adjustColor(of: label1)



























