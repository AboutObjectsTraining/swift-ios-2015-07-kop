
//: Optionals

let foo = "Hello World!"

let bar: String? = "Farewell World!"

print(foo)
print(bar)

var baz: String? = nil
print(baz)

if (baz == Optional.None)
{
    print("I'm really an optional that's set to None")
}

// let myString: String = baz!  // Illegal!

// print(baz!)

print("Got here")


if let myString = baz {
    print(myString)
}
else {
    print("Failed to unwrap myString")
}


baz = bar

if bar == nil {
    print("bar is nil")
}
else {
    print(bar!)
}
