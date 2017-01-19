// 1
enum ConnectionError: Error {
    case noInternet, slowConnection, reallySlowConnection
}

// 2
func checkConnection(connStrenght: Int) throws -> String {
    // 3
    switch connStrenght {
    case 0:
        throw ConnectionError.noInternet
    case 1...10:
        throw ConnectionError.reallySlowConnection
    case 11...50:
        throw ConnectionError.slowConnection
    default:
        return "Good Connection"
    }
}

// 4
do {
    let result = try checkConnection(connStrenght: 7)
    print("Connection possible: \(result)")
} catch ConnectionError.reallySlowConnection {  // 5
    print("Some snails are trying to carry your bits to the other side")
} catch {
    print("There was a connection error: \(error)")
}
