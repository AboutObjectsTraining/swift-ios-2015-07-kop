//: Playground - noun: a place where people can play

import Cocoa

var foo = [10, 20, 30]
unsafeAddressOf(foo)
print(foo)

foo[0] = 99
unsafeAddressOf(foo)
print(foo)


foo[2] = 42
unsafeAddressOf(foo)
print(foo)
