// 1
enum CompassPoint {
    case north, south, east, west
}
print(CompassPoint.north)

// 2
var direction = CompassPoint.north

// 3
switch direction {
case .north:
    print("Go North")
case .south:
    print("Go South")
case .east:
    print("Go East")
case .west:
    print("Go West")
}

// 4
enum Position: Double {
    case latitude = 1.01
    case longitude = 2.02
}

print(Position.latitude.rawValue)
print(Position.longitude.rawValue)

// 5 & 6
enum ShapeDimensions {
    case Square(Double)
    case Rectangle(width: Double, height: Double)
    
    // 7 & 9
    func area() -> Double {
        switch self {
        case .Square(let side):
            return side * side
        case let .Rectangle(width, height):
            return width * height
        }
    }
}

// 8
var squareShape = ShapeDimensions.Square(4)

// 10
print(squareShape.area())

// 11
var rectShape = ShapeDimensions.Rectangle(width: 10, height: 20)
print(rectShape.area())
