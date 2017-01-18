// Creating an implicit optional
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be of type "Int?", or "optional Int

let posNum = "baba"
let convNum = Int(posNum)
let numMirror = Mirror(reflecting: convNum)
print(numMirror.subjectType)

// Creating an explicit optional
var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value

var optString: String?

// Unwrapping an optional
if convertedNumber != nil {
    print("convertedNumber contains an integer value of \(convertedNumber!).")
}
if convNum == nil {
    // convNum! will give an error here
    print("convNum doesn't contain a number; value: \(convNum)")
}

// Optional binding
if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}

// Multiple optional bindings
if let firstNumber = Int("4"),
    let secondNumber = Int("42"),
    firstNumber < secondNumber && secondNumber < 100 {
print("\(firstNumber) < \(secondNumber) < 100")
}

print(">====================")

// Implicitly unwrapped optional
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark

// Optional chaining
var errorCodeString: String?
errorCodeString = "404"
var errorDescription: String?
if let theError = errorCodeString, let errorCodeInt = Int(theError), errorCodeInt == 404 {
    errorDescription = "\(errorCodeInt + 200): resource not found"
}

var upCaseErrorDescription = errorDescription?.uppercased()
errorDescription

upCaseErrorDescription?.append(". Please try again")
upCaseErrorDescription

let description = errorDescription ?? "No error"

// Force unwrap a nil optional
//let value: String? = nil
//print(value!)
