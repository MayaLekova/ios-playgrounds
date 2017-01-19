// 1
class Animal {
    
}

class Dog: Animal {
    var name = "Sharo"
}

class Cat: Animal {
    
}

// 2
var animal: Animal = Dog()
animal as! Dog // we know that animal is convertible to Dog because it's initialized with it
// animal as Dog -> the compiler complains that the two types are not convertible

// 3
var dog = Dog()
dog as Animal   // we know that this works because Dog is a subclass of Animal

// 4
let dog2: Dog? = nil
print(dog2?.name)
// print(dog2!.name) -> crashes because dog2 is nil

// 5
let animal1: Animal = Cat()
