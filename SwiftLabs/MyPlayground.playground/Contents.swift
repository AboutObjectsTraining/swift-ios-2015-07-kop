var str = "Hello, playground"

var foo: Int
foo = 42
foo *= 2

func multiply(x: Double, y: Double) -> Double
{
    let result = x * y
    return result
}


multiply(3, 7)
multiply(4, 6)
multiply(5, 7)
multiply(6, 8)

let anyThing: Any = "String"

let values = (3.5, 42, "Hello", 1)
values.0
values.1

var cost: (price: Double, quantity: Int)

cost = (9.99, 12)
cost.price
cost.quantity
