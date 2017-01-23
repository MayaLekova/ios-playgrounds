// 1
func printName(name: String) {
    print("Name is \(name)")
}

// 2
printName(name: "Maya")

// 3
func printName(name: String, age: Int) {
    print("Name is \(name), age is \(age)")
}
printName(name: "Maya", age: 27)

// 4
func changeName(name: inout String) {
    name += " Lekova"
}

// 5
var name = "Maya"
changeName(name: &name)

// 6
typealias nameAndAge = (String, Int)

// 7
func returnName(name: String) -> nameAndAge {
    return (name, 21)
}
returnName(name: "Maya")
