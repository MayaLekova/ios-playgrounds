// Closure expressions
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)

var reversedNames2 = names.sorted(by:
    { (s1: String, s2: String) -> Bool in
        return s1 > s2
    }
)

var reversedNames3 = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )

var reversedNames4 = names.sorted(by: { s1, s2 in return s1 > s2 } )

var reversedNames5 = names.sorted(by: { s1, s2 in s1 > s2 } )

var reversedNames6 = names.sorted(by: { $0 > $1 } )

var reversedNames7 = names.sorted(by: >)

// Trailing Closures
var reversedNames8 = names.sorted() { $0 > $1 }

// Gets even uglier
var reversedNames9 = names.sorted { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    // These are the closure's arguments here, blah
    (number) -> String in
    
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    
    return output
}

// Capturing Values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func increment() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return increment
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()

incrementByTen()

// Closures Are Reference Types
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

// Escaping closures
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure(completionHandler: { self.x = 100 })
        someFunctionWithNonescapingClosure(closure: { x = 200 })
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

// Autoclosures
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)

func serve(customer provideCustomer: () -> String) {
    print("Now serving \(provideCustomer())!")
}
serve(customer: { customersInLine.remove(at: 0) } )

// Hide everything under the carpet
func serve2(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve2(customer: customersInLine.remove(at: 0))

// Escaping autoclosures
// Or how to over-complicate things even further
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// Prints "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
