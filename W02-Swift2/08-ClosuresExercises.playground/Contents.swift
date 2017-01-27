// How do we name the members of this tuple?
typealias APIResponse = (Bool, String, Int) -> Void

func userRequest(path: String, onCompletion: @escaping APIResponse) {
    getUserAddress(onCompletion: onCompletion)
}

// Why do we use @escaping here?
func getUserAddress(onCompletion: @escaping APIResponse) {
    onCompletion(true, "Kattenburgerstraat, Amsterdam", 101)
}

userRequest(path: "") { (success, message, code) in
    if success {
        print(message)
    } else {
        print("Epic fail")
    }
}

func sum(from: Int, to: Int, f: (Int) -> Int) -> Int {
    var sum = 0
    for i in from...to {
        sum += f(i)
    }
    return sum
}
sum(from: -10, to: -1, f: abs)

var sum: (Int, Int) -> Int = {
    return $0 + $1
}
sum(2,3)

var numbers = [1,4,2,5,8,3]
numbers.sort(by: <)
numbers.sort(by: >)

print(numbers.sorted(by: { return $0 < $1 }))

class Kraken {
    // Why is this implicitly unwrapped optional?
    var tentacle: Tentacle! = Tentacle()
    var closureToEat: (() -> Void)!
    var whatAmIDoing = "Hello"
    
    func initializeClosure() {
        closureToEat = { [unowned self] in
            self.tentacle.writheAround()
            self.whatAmIDoing = "Eating"
            self.eatSomething()
        }
    }
    func eatSomething() {
        print("Eat some humans")
    }
    deinit {
        print("deinit kraken")
    }
}

class Tentacle {
    func writheAround() {
        print("Grab a human")
    }
    
    deinit {
        print("deinit tentacle")
    }
}

var kraken: Kraken! = Kraken()

kraken.initializeClosure()
kraken.closureToEat()

kraken = nil