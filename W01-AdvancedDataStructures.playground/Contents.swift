// 4
let people = ["Daniel", "Jasper", "Axel"]

// 5
print(people[0])
print(people[2])

// 6
for (index, name) in people.enumerated() {
    print("Hello \(name), you are number \(index)")
}

// 7
print("============")
for index in 0..<3 {
    print("Hello again \(people[index])")
}

// 9
var teachers = [
    "Daniel": "tea",
    "Jasper": "tea",
    "Niels": "tea",
    "Axel": "coffee",
    "Martijn": "coffee",
]

// 10
print("============")
print("people array has \(people.count) items")
print("teachers dictionary has \(teachers.count) items")

// 11
print("============")
print(teachers["Martijn"]!)
// 12
print(teachers["John"]) // Returns nil

// 13
print("============")
for (name, beverage) in teachers {
    print("\(name) drinks \(beverage) in the morning")
}

// 14
// Because dictionary is internally implemented as a hash map, which doesn't preserve the order of entries
