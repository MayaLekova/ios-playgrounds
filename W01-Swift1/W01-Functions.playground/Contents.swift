// String -> String function
func greet(person: String) -> String {
    let msg: String = "Hello, \(person)"
    return msg
}

print(greet(person: "Baba"))

func greetAgain(person: String) -> String {
    return "Hello again, \(person)"
}

print(greetAgain(person: "Dedo"))

// overloading
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))

// void function
func greetVoid(person: String) {
    print("Hello, \(person)")
}
greetVoid(person: "Vnuche")

// ignoring return value
func printAndCount(str: String) -> Int {
    print(str)
    return str.characters.count
}

func simplyPrint(str: String) {
    let _ = printAndCount(str: str)
}

printAndCount(str: "Text 1")
simplyPrint(str: "Text 2")

// multiple return values
func minMax(nums: [Int]) -> (min: Int, max: Int)? {
    guard nums.count > 0 else {
        return nil
    }
    
    var min = nums[0]
    var max = nums[0]
    for n in nums {
        if n < min {
            min = n
        }
        if n > max {
            max = n
        }
    }
    
    return (min, max)
}

if let bounds = minMax(nums: [5,1,3,4,2,6,8,7]) {
    print("Min: \(bounds.min), max: \(bounds.max)")
} else {
    print("Empty array")
}

// argument labels and parameter names
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}

greet(person: "Maya", from: "Sofia")

// omitting argument label
func multiplyBy2(_ n: Int) -> Int {
    return n * 2
}

multiplyBy2(3)

// default values
func power(_ d: Double, exponent: Int = 2) -> Double {
    var res = d
    for _ in 1..<exponent {
        res *= d
    }
    return res
}

power(3.0)
power(3.0, exponent: 4)

// variadic parameters
func average(_ nums: Double...) -> Double {
    var sum = 0.0
    for n in nums {
        sum += n
    }
    return sum / Double(nums.count)
}

average(1, 2, 3, 4, 5)
average(3, 8.25, 18.75)

// In-out parameters
func swap(_ a: inout Int, _ b: inout Int) {
    let tmp = a
    a = b
    b = tmp
}

var n = 10, m = 20
swap(&n, &m)
print("n: \(n), m: \(m)")

// function types
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunc: (Int, Int) -> Int = addTwoInts
mathFunc(2,3)
mathFunc = multiplyTwoInts
mathFunc(2,3)

// passing functions as parameters
func reduceInts(list: [Int], op: (Int, Int) -> Int, base: Int = 0) -> Int {
    var curr = base
    for i in list {
        curr = op(curr, i)
    }
    return curr
}

reduceInts(list: [1, 2, 3, 4, 5], op: addTwoInts)
reduceInts(list: [1, 2, 3, 4, 5], op: multiplyTwoInts, base: 1)

// returning functions
func step(forward: Bool) -> (Int) -> Int {
    func stepForward(_ a: Int) -> Int {
        return a + 1
    }
    func stepBackward(_ a: Int) -> Int {
        return a - 1
    }

    return forward ? stepForward : stepBackward
}

func oscillator(initial: Int) {
    var cnt = 1
    var value = initial
    var direction = false
    while cnt < 20 {
        print(value)
        if cnt % 5 == 0 {
            direction = !direction
        }
        value = step(forward: direction)(value)
        cnt += 1
    }
}
oscillator(initial: 10)
