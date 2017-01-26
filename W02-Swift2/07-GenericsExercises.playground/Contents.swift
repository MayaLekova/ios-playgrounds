// Under the hood of optionals
// Inspired by http://www.mokacoding.com/blog/writing-your-own-swift-if-let/#

// Part 1: What we can do with original optionals
let optionalName = Optional<String>.some("John")

if let name = optionalName {
    print(name)
} else {
    print("Nothing")
}

let input: String? = "a string"
// Use the return value of "if let"
let output: Int = {
    if let string = input {
        return string.characters.count
    } else {
        return -1
    }
}()

// Our own try at implementing an "Optional" class
enum MyOptional<W> {
    case none
    case some(W)
    
    func ifLet<R>(then: (W) -> R, else elseFunc: () -> R) -> R {
        switch self {
        case .none:
            return elseFunc()
        case .some(let value):
            return then(value)
        }
    }
    func unwrap() -> W? {
        switch self {
        case .none:
            return nil
        case .some(let value):
            return value
        }
    }
}

// MyOptional in action
let optString = MyOptional<String>.some("Baba")
optString.ifLet(then: { (name) in
    print(name)
}, else: {
    print("No value")
})

let optString2 = MyOptional<String>.none
optString2.ifLet(then: { (name) in
    print(name)
}, else: {
    print("No value")
})

let charCount = optString.ifLet(then: { (s: String) -> Int in
    return s.characters.count
}, else: { () -> Int in
    return -1
})
print("The length of string \(optString.unwrap()!) is \(charCount)")
