// Creating
enum CompassPoint: String {
    case north
    case south
    case east
    case west
}

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.east
directionToHead = .west

// Matching cases
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

let somePlanet = Planet.venus

switch somePlanet {
case .earth:
    print("Safe for living")
default:
    print("Not a good place to be")
}

// Associated types
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)

func printBarcode(code: Barcode) {
    switch productBarcode {
    case let .upc(numberSystem, manufacturer, product, check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    case .qrCode(let productCode):
        print("QR code: \(productCode).")
    }
}

printBarcode(code: productBarcode)

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
printBarcode(code: productBarcode)

// raw values
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

let earthsOrder = Planet.earth.rawValue
let sunsetDirection = CompassPoint.west.rawValue

let possiblePlanet = Planet(rawValue: 7)
let nonexistantPlanet = Planet(rawValue: 11)
