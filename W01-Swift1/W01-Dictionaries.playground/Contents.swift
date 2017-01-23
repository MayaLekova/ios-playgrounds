// Creating
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers

namesOfIntegers = [:]

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var anotherAirports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

// Mutation
airports.count

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

// Upserting
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"
airports

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
} else {
    print("There was no such value")
}

// Retrieving
if let airportName = airports["DUB"] {
    print("The name is \(airportName)")
} else {
    print("There was no such airport")
}

// Deleting
airports["APL"] = "Apple International"
airports["APL"] = nil

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

// Iterating
print("========\n All airports")
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

print("========\n Airport codes")
for airportCode in airports.keys {
    print(airportCode)
}

print("========\n Airport names")
for airportName in airports.values {
    print(airportName)
}

print("========\n Sorted airports")
for airportCode in airports.keys.sorted() {
    let airportName = airports[airportCode]
    print("\(airportCode): \(airportName)")
}
