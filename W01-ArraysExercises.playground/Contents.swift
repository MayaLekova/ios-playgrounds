// 1 & 2
var bucketList: [String] = ["item1", "item2", "item3"]

// 3
bucketList.insert("new item", at: 1)

// 4
bucketList[1] += " gets longer"

// 5
print("========\n Array")
for item in bucketList {
    print(item)
}

// 6
print("========\n Sorted array")
for item in bucketList.sorted() {
    print(item)
}

// 7
print("========\n Sorted array in desc. order")
for item in bucketList.sorted(by: {$1 < $0}) {
    print(item)
}

// 8
// Array with indices
print("========\n Array with indices")
for (index, item) in bucketList.enumerated() {
    print("Element \(index) is \(item)")
}

// Filtering an array
print("========\n Elements with short names")
for item in bucketList.filter({ $0.characters.count < 6 }) {
    print(item)
}

// Reversing an array
print("========\n Reversed array")
for item in bucketList.reversed() {
    print(item)
}
