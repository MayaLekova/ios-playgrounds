// Creation
var letters = Set<Character>()

if letters.isEmpty {
    print("Set is empty")
}

letters.insert("a")
print("letters is of type Set<Character> with \(letters.count) items.")

letters
letters = []

// Mutating
var favoriteGenres: Set<String> = ["Rock", "Gothic", "Industrial"]

favoriteGenres.insert("Electronic")
favoriteGenres

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

// Iteration
print("=======\n Genres")
for genre in favoriteGenres {
    print(genre)
}

print("=======\n Sorted genres")
for genre in favoriteGenres.sorted() {
    print(genre)
}

print("=======\n Descending sort")
for genre in favoriteGenres.sorted(by: { $0 > $1 }) {
    print(genre)
}

// Set operations - fundamental
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

// Set operations - equality checking
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)
