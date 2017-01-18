//for index in 1...5 {
//    print("\(index) times 5 is \(index * 5)")
//}

//let base = 3
//let power = 10
//var answer = 1
//for _ in 1...power {
//    answer *= base
//}
//print("\(base) to the power of \(power) is \(answer)")

//let names = ["Anna", "Alex", "Brian", "Jack"]
//for name in names {
//    print("Hello, \(name)!")
//}

//let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
//for (animalName, legCount) in numberOfLegs {
//    print("\(animalName)s have \(legCount) legs")
//}

// Ladders and snakes game
import Darwin

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)

// ladders
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
// snakes
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    print("Currently at square \(square)")

    // roll the dice
    diceRoll = Int(arc4random_uniform(6) + 1)
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
}
print("Game over!")

square = 0
repeat {
    print("Currently at square \(square)")
    
    // move up or down for a snake or ladder
    square += board[square]
    // roll the dice
    diceRoll = Int(arc4random_uniform(6) + 1)
    // move by the rolled amount
    square += diceRoll
} while square < finalSquare
print("Game over!")