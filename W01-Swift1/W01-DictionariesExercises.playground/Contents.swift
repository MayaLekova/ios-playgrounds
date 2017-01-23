// 1
var movieRatings: [String: Int]

// 2
movieRatings = ["TopGun" : 1, "StarWars" : 4, "ForestGump" : 5]
for (name, rating) in movieRatings {
    print("Movie \(name) has rating of \(rating)")
}

// 3
movieRatings["TopGun"] = 5
print(movieRatings["TopGun"]!)

// 4
movieRatings.removeValue(forKey: "TopGun")
