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

// Associated Types
print("======= Associated types =======")
protocol Container {
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct IntStack: Container {
    // original IntStack implementation
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    // Not mandatory
    typealias ItemType = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

// Generic class that adopts the protocol
struct GenStack<Element>: Container {
    // original Stack<Element> implementation
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

// Extending an Existing Type to Specify an Associated Type
extension Array: Container {}

// Test the above
var ints = IntStack()
ints.append(7)
ints.count

var ints2 = GenStack<Int>()
ints2.append(3)
ints2.append(42)
ints2.append(5)
ints2.count

var arr = [1,2,3,4,5]

// Generic version of reduce where the type conforms to a protocol
func reduceContainer<T: Container>(container: T, base: T.ItemType, op: (T.ItemType, T.ItemType) -> T.ItemType) -> T.ItemType {
    var curr = base
    for i in 0..<container.count {
        curr = op(curr, container[i])
    }
    return curr
}

// Exercise 3 different ways of passing closures
print("Sum of ints: \(reduceContainer(container: ints, base: 0, op: +))")
print("Sum of ints2: \(reduceContainer(container: ints2, base: 0, op: { a, b in a + b }))")
print("Sum of arr: \(reduceContainer(container: arr, base: 0) { $0 + $1 })")

// Generic version of reduce
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func reduce<T>(list: [T], base: T, op: (T, T) -> T) -> T {
    var curr = base
    for i in list {
        curr = op(curr, i)
    }
    return curr
}

reduce(list: [1, 2, 3, 4, 5], base: 0, op: addTwoInts)
print("Product of numbers 1...5: \(reduce(list: [1, 2, 3, 4, 5], base: 1) { $0 * $1 })")

// Generic Where Clauses
func allItemsMatch<C1: Container, C2: Container>
    (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
        
        // Check that both containers contain the same number of items.
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        // Check each pair of items to see if they are equivalent.
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        
        // All items match, so return true.
        return true
}

var ints3 = GenStack<Int>()
for i in 1...5 {
    ints3.append(i)
}

allItemsMatch(arr, ints3)
