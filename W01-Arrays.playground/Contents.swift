// Creating
var someInts = [Int]()
someInts.append(3)
print("someInts is of type [Int] with \(someInts.count) items.")
someInts = []

var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

// Array literal
var shoppingList: [String] = ["Milk", "Honey", "Bread"]
var anotherShoppingList = ["Milk", "Bread"]

// Checking if empty
if shoppingList.isEmpty {
    print("Empty")
} else {
    print("Non empty")
}

// Mutating
shoppingList.append("Hammer")
shoppingList += ["Nails"]
shoppingList[2]
shoppingList[1...3] = ["Salt", "Pepper"]
shoppingList
shoppingList.insert("Beer", at: 2)
let beer = shoppingList.remove(at: 2)
shoppingList
let nails = shoppingList.removeLast()
shoppingList

// Enumerating
for item in shoppingList {
    print(item)
}

for (index, item) in shoppingList.enumerated() {
    print("\(item) at index \(index)")
}
