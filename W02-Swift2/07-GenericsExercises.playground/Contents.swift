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

// Part 2: Our own try at implementing an "Optional" class
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

// Part 3: Various exercise on generics
func mid<T: Comparable>(_ array: [T]) -> T {
    return array.sorted()[(array.count - 1) / 2]
}
mid([3, 5, 1, 2, 4])

// Self refers to the type adopting the protocol
protocol Summable { static func +(lhs: Self, rhs: Self) -> Self }

extension Int: Summable {}
extension Double: Summable {}

func add<T: Summable>(_ x: T, _ y: T) -> T {
    return x + y
}

let intSum = add(2, 3)
let doubleSum = add(2.3, 4.5)

// Making the String type Summable
extension String: Summable {
    // We can omit the following definition
    static func +(lhs: String, rhs: String) -> String {
        var ret = lhs
        ret.append(rhs)
        return ret
    }
}

let strSum = add("ala", "bala")

// Generic structure
struct Queue<Element: Equatable> {
    // Thanks to http://stackoverflow.com/a/39735301
    fileprivate var elements = [Element]()
    
    mutating func enqueue(_ newElement: Element) {
        elements.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.remove(at: 0)
    }
}

extension Queue {
    func peek() -> Element? {
        return elements.first
    }
    func homogeneous() -> Bool {
        if let first = elements.first {
            return !elements.contains { $0 != first }
        }
        // Empty queue is considered homogeneous
        return true
    }
}

var q = Queue<Int>()

q.enqueue(4)
q.enqueue(2)

q.dequeue()
q.dequeue()
q.dequeue()
q.dequeue()

q.enqueue(5)
q.enqueue(3)
q.peek()
q.homogeneous()

// Subclassing Generic Classes
class Box<T> {
    var weight: Int = 0
}

class Gift<T>: Box<T> {
    let recipient: String
    init(recipient: String) {
        self.recipient = recipient
    }
    func receive() {
        print("\(recipient) got a gift weighing \(weight) kg")
    }
}

class StringBox: Box<String> {
}

let box = Box<Int>()
let gift = Gift<Double>(recipient: "Baba")
gift.weight = 42
gift.receive()
let stringBox = StringBox()

// Enums With Multiple Generic Associated Values
enum Result<ValueType, ErrorType> {
    case Success(ValueType)
    case Failure(ErrorType)
}

func divideOrError(_ x: Int, _ y: Int) -> Result<Int, String> {
    guard y != 0 else {
        return Result.Failure("Division by zero is undefined")
    }
    return Result.Success(x / y)
}

let result1 = divideOrError(42, 2)
let result2 = divideOrError(42, 0)
