func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
    
    let condition: Bool = false
    guard condition else {
        print("Condition not met")
        return
    }
}

greet(person: ["name": "John"])
greet(person: ["name": "Jane", "location": "Cupertino"])