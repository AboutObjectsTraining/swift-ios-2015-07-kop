
var hello: String! = "Hello"

print(hello)

hello = nil

print(hello)

// print(hello.lowercaseString) // Illegal!


print("Got here")


let things: [Any] = [123, "Hey!", 1.5]
let otherThings: Array<Any> = [1, 1.5, "Two"]

print(things)

let firstObj = things[0] as! Int
let sum = firstObj + 3

if let first = things[0] as? Int {
    print("\(first + 3)")
}

if things[0] is Int {
    print("Is Int")
}


// let otherSum = things[0] + 12 // Illegal!