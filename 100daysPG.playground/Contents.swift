import UIKit

// Checkpoint 1
print("\nCheckpoint 1")
let ctemp = 2.5
let ftemp = ctemp * 9/5 + 32
print("C: \(ctemp) F: \(ftemp)")

// Checkpoint 2
print("\nCheckpoint 2")
let arr = ["one", "two", "three", "three"]
print("# Items: \(arr.count)")
print("# Unique: \(Set(arr).count)")

// Checkpoint 3
print("\nCheckpoint 3")
//for i in 1...100 {
//    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
//        print("FizzBuzz")
//    }else if i.isMultiple(of: 3) {
//        print("Fizz")
//    }else if i.isMultiple(of: 5) {
//        print( "Buzz")
//    }else{
//        print(i)
//    }
//}
print("\n... Using a switch!")
for i in 1...100 {
    switch i {
    case _ where i.isMultiple(of: 3) && i.isMultiple(of: 5):
        print("FizzBuzz")
    case _ where i.isMultiple(of: 3):
        print("Fizz")
    case _ where i.isMultiple(of: 5):
        print("Buzz")
    default:
        print(i)
    }
}

// Checkpoint 4
print("\nCheckpoint 4")

enum SqrtErr: Error{
    case OutOfBounds
    case NoRoot
}

func int_sqrt(_ num: Int) throws -> Int {
    if num < 1 || num > 10000{
        throw SqrtErr.OutOfBounds
    }
    for i in 1...100{
        if i*i == num{
            return i
        }
    }
    throw SqrtErr.NoRoot
}

do{
    let sqrt = try int_sqrt(16)
    print("The integer root is \(sqrt)")
}catch SqrtErr.OutOfBounds{
    print("Out of Bounds")
}catch SqrtErr.NoRoot{
    print("No root found")
}catch{
    print("Error")
}


// Checkpoint 5
print("\nCheckpoint 5")
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
// filter out even #s, sort asc, map "is a lucky number", print on seperate lines
print(luckyNumbers.filter{
    $0 % 2 == 1
}.sorted{
    $0 < $1
}.map{
    "\($0) is a lucky number"
}.joined(separator: "\n"))

// Checkpoint 6
print("\nCheckpoint 6")
struct Car{
    let model: String
    let seats: Int
    var currentGear: Int
    
    init(model: String, seats: Int, currentGear: Int = 1) {
        self.model = model
        self.seats = seats
        self.currentGear = currentGear
    }
    
    mutating func changeGear(_ direction: String) {
        if direction == "up" {
            currentGear += 1
        }else if direction == "down" && currentGear > 1{
            currentGear -= 1
        }
    }
}

var audi = Car(model: "A6", seats: 5)
print("The gear is \(audi.currentGear)")
audi.changeGear("up")
print("The gear is \(audi.currentGear)")

// Checkpoint 7
print("\nCheckpoint 7")

class Animal{
    var legs = 4
}

class Dog: Animal{
    func speak(){
        print("Woof!")
    }
}

class Corgi : Dog{
    override func speak(){
        print("I'm a corgi")
    }
}

class Poodle : Dog{
    override func speak(){
        print("I'm a poodle")
    }
}

class Cat: Animal{
    var isTame: Bool
    
    init(tame: Bool){
        self.isTame = tame
    }
    
    func speak(){
        print("Meow!")
    }
}

class Persian : Cat{
    override func speak(){
        print("I'm a persian")
    }
}

class Lion : Cat{
    override func speak(){
        print("I'm a lion")
    }
}

var persian = Persian(tame: false)
persian.speak()

var poodle = Poodle()
poodle.speak()

var dog = Dog()
dog.speak() 

var cat = Cat(tame: false)
cat.speak() 

// Checkpoint 8
print("\nCheckpoint 8")

protocol Building{
    var rooms: Int { get }
    var cost: Int { get }
    var estateAgent: String { get }
    
    func printSalesSumamry()
}
struct House: Building{
    var rooms = 7
    var cost = 500000
    var estateAgent = "Anand"
    func printSalesSumamry() {
        print("\(rooms) room house sold for \(cost) by \(estateAgent)")
    }
}
struct Office: Building{
    var rooms = 50
    var cost = 9000000
    var estateAgent = "Wetzel"
    func printSalesSumamry() {
        print("\(rooms) room office sold for \(cost) by \(estateAgent)")
    }
}

var house = House()
house.printSalesSumamry()

var office = Office()
office.printSalesSumamry()

// Checkpoint 9
print("\nCheckpoint 9")



func getRand(arr: [Int]? ) -> Int{
    return arr?.randomElement() ?? 20
}

var a: [Int]? = [1,2,3,4,5]
print(getRand(arr: a))

a = nil
print(getRand(arr: a))
