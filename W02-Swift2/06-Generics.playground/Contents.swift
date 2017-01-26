// Generic Functions
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let tmp = a
    a = b
    b = tmp
}

var a = 2, b = 4
var c = "baba", d = "dedo"

swapTwoValues(&a, &b)
print("a: \(a), b: \(b)")

swapTwoValues(&c, &d)
print("c: \(c), d: \(d)")

// Generic types
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    var isEmpty: Bool {
        return items.isEmpty
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")


// Extending a Generic Type
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

// We put a quote in your quote so you can quote while you quote
print("Top item: \(stackOfStrings.topItem ?? "No item")")

while !stackOfStrings.isEmpty {
    print(stackOfStrings.pop())
}

// Such nesting, much wow!
// Taken from ANTLR4 examples
var x = "foo"
var y = 9
var str = "Hello, \(x + "b\(y)r") playground"

// Type Constraints
// TODO: read http://nshipster.com/swift-comparison-protocols/
func findIndex<Т: Comparable>(of valueToFind: Т, in array: [Т]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(of: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}
let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])

// TODO: Associated Types
