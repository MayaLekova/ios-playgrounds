// 1
var favouriteGenres: Set = ["Trance", "Gothic Rock", "Industrial"]

// 2
if let removed = favouriteGenres.remove("Chalga") {
    print("Why did you like chalga? Best to remove it!")
} else {
    print("Thanks God you never liked chalga")
}

// 3
if !favouriteGenres.contains("Funk") {
    favouriteGenres.insert("Funk")
}

// 4
var groceryBag1 = Set<String>()
groceryBag1.insert("Hammer")
groceryBag1.insert("Nails")
groceryBag1.insert("Pins")
var groceryBag2 = Set<String>()
groceryBag2.insert("Saw")
groceryBag2.insert("Hammer")
groceryBag2.insert("Nails")
groceryBag2.insert("Axe")

// 5
var combinedBag = groceryBag1.union(groceryBag2)
print("=========\n Combined bag:")
for item in combinedBag {
    print(item)
}

// 6
var intersectedBag = groceryBag1.intersection(groceryBag2)
print("=========\n Intersected bag:")
for item in intersectedBag {
    print(item)
}

// 7
if groceryBag1.isDisjoint(with: groceryBag2) {
    print("Grocery bags are disjoint")
} else {
    var symDiff = groceryBag1.symmetricDifference(groceryBag2)
    print("=========\n Symmetric difference bag:")
    for item in symDiff {
        print(item)
    }
}
