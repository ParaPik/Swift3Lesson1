//: Playground - noun: a place where people can play

import UIKit

class SomeClass {
    
    var number: Int = 20
    
}

var some_name: Int = 10
some_name = 20

var double_value: Double = 10
var int_value: Int = 20

double_value = double_value + Double(int_value)

var a = 5
var str: String = "Hello, playground"
print(str)

var logical_variable: Bool? = nil
logical_variable = true
logical_variable = nil

var optional: Bool! = nil
var local: Int

if let log = logical_variable {
    
}

var obj: SomeClass? = SomeClass()
obj!.number

var cortege: (a: Int, b: (d: Int, e: Int), c: Int) = (10, (40, 50), 30)
var (_, c, b) = cortege
print(c)
print(b)

var numOne = 5
var numTwo = 10

(numOne, numTwo) = (numTwo, numOne)

var arr: [Int] = [10, 20, 30]
arr[0] = 20
arr[0] = arr[1]
arr.append(40)
arr.remove(at: 0)

for i in 0..<arr.count {
    print(arr[i])
}

print("New output:")
for elem in arr {
    print(elem)
}

let matrix = [[10, 20], [30, 40]]

arc4random() % 10 + 1

var empty_array: [[UInt32]] = []
