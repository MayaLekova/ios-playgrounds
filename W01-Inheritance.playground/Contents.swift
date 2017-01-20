//: Playground - noun: a place where people can play

// 1
class Dog {
    func bark() {
        print("Bark")
    }
}

// 2
class DrugSniffingDog: Dog {
    
}

// 3
class SwimmingDog: Dog {
    
}

// 4
// 5 -> Multiple inheritance is not allowed
// http://stackoverflow.com/questions/25595506/why-i-can-not-inherit-from-multiple-classes-in-swift-just-like-its-library-clas
class GermanShepherd: DrugSniffingDog/*, SwimmingDog*/ {
    // 6 -> This is bad because the swim bevaiour must be encapsulated in the SwimmingDog class, not here
    func swim() {
        print("Woof, I'm swimming!")
    }
}

// 7
class Poodle: Dog {
    // 8 -> Not good because you may forget to do it
    override func bark() {
        print("Yap")
    }
}

var poopoo = Poodle()
poopoo.bark()
