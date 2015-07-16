
class Dog {
    var name: String?
}

class Person {
    var name: String?
    var dog: Dog?
}


var fred: Person? = Person()

print(fred)
print(fred?.name)

fred!.dog = Dog()
print(fred?.dog?.name)


fred?.dog?.name = "Rover"
print(fred?.dog?.name)

if let name = fred?.dog?.name {
    print("Dog's name is \(name)")
}
else {
    print("Dog's name is not set.")
}



