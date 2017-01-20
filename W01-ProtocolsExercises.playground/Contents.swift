protocol Barker {
    func bark()
}

protocol Swimmer {
    func swim()
}

protocol Sitter {
    func sit()
}

class GermanShepherd: Barker, Swimmer, Sitter {
    internal func bark() {
        print("Bark!")
    }
    
    internal func sit() {
        print("Sits when told")
    }
    
    internal func swim() {
        print("Swims fast")
    }
}

class Poodle: Barker, Sitter {
    internal func sit() {
        print("Sits sometimes")
    }
    
    internal func bark() {
        print("Yap")
    }
}

var rex = GermanShepherd()
rex.sit()

var poopoo = Poodle()
poopoo.bark()

print("////////////////////////////////")

protocol DogSoundMaker {
    func makeSound()
}

protocol AnotherBarker: DogSoundMaker {
    func makeSound()
}

protocol Yapper: DogSoundMaker {
    func makeSound()
}

protocol Woofer: DogSoundMaker {
    func makeSound()
}

extension AnotherBarker {
    func makeSound() {
        print("Bark")
    }
}

extension Yapper {
    func makeSound() {
        print("Yap")
    }
}
extension Woofer {
    func makeSound() {
        print("Woof")
    }
}

class Pinscher: Yapper {
    
}

class CockerSpaniel: AnotherBarker {
    
}

class StBernard: Woofer {
    
}

var dogs: [DogSoundMaker] = [Pinscher(), CockerSpaniel(), StBernard()]
for d in dogs {
    d.makeSound()
}
