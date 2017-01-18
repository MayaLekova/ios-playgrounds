var num = 42

switch num {
case 41:
    print("Something")
case 42:
    print("Other thing")
default:
    print("Default")
}

var num2 = 3.1415

switch num2 {
case 3.14:
    print("Almost equal")
case 3.1415:
    print("Exactly equal")
default:
    print("Not at all")
}

var str = "Baba"

switch str {
case "Baba":
    print("Pravi zimnina")
case "Dqdo":
    print("Pie rakiq")
default:
    print("Ne znam")
}

var statusCode: Int = 418
var errorString: String = "The request failed with the error: "

switch statusCode {
case 100, 101:
    errorString += "Informational, \(statusCode)."
case 204:
    errorString += "Successful but no content, 204."
case 300...307:
    errorString += "Redirection, \(statusCode)."
case 400...417:
    errorString += "Client error, \(statusCode)."
case 500...505:
    errorString += "Server error, \(statusCode)."
case let unknownCode where (unknownCode >= 200 && unknownCode < 300)
                        || unknownCode > 505:
    errorString = "\(unknownCode) is not a known error code."
default:
    errorString = "Unexpected error occured"
}

print(errorString)

let error = (code: statusCode, error: errorString)
error.code
error.error

let firstErrorCode = 200
let secondErrorCode = 404
let errorCodes = (firstErrorCode, secondErrorCode)

switch errorCodes {
case (404, 404):
    print("No items found")
case (404, _):
    print("First item not found")
case (_, 404):
    print("Second item not found")
default:
    print("All items found")
}