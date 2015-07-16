
var count: Int = 1

func sayHello()
{
    println("Hello! \(count++)")
}

sayHello()

//var foo: (Int) -> Void = sayHello(2)

func saySomething(myFunction: (() -> Void))
{
    myFunction()
}


saySomething(sayHello)


saySomething {
    println("Hey There!")
}

