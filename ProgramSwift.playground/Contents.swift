//: Playground - noun: a place where people can play

import UIKit

let professors = [
    (name: "Alexey Pupkin", age: 45, money: 3000),
    (name: "Vladimir Mikhailov", age: 30, money: 5000),
    (name: "Alexandre Pushkin", age: 150, money: 1000000),
    (name: "Ivan Ivanovich", age: 18, money: 2000),
    (name: "Vladimir Putin", age: 70, money: 0),
    (name: "Jeky Chan", age: 60, money: 20000),
    (name: "Donald Trump", age: 70, money: 12000),
    (name: "Hilary Clinton", age: 75, money: 10000)
]

var middleAge = 0

for person in professors {
    middleAge += person.age
}

middleAge /= professors.count

// Находим имена всех профессоров
var names: [String] = []
for person in professors {
    let nameParts = person.name.components(separatedBy: " ")
    names.append(nameParts[0])
}
names

// Найдем человека, который получает больше всех

var maxMoney = 0
var maxMoneyPerson = ""
for person in professors {
    if person.money > maxMoney {
        maxMoney = person.money
        maxMoneyPerson = person.name
    }
}
(maxMoneyPerson, maxMoney)

/*
 Вводится массив, представляющий собой сжатие серий нулей и единиц, где каждый элемент обозначает количество элементов в очередной серии нулей или единиц. Но если первым элементом вводимого массива является 0, значит первая серия распакованного массива - единицы. Например:
 
 массив [2, 3] распаковывается как 00111,
 массив [0, 4, 1, 2] распаковывается как 1111011.
 Требуется написать программу распаковки вводимого массива.
 */

var result = ""
var inputArray: [Int] = []
let itemCount = 5

for i in 1...itemCount {
    inputArray.append(Int(arc4random() % 5))
}

// Flag = true, если нужно выводить единицы
// Если false, то выводим нули
var flag = inputArray[0] == 0

// Если первый элемент не 0, то начинаем с первого элемента массива, иначе со второго
let startIndex = flag ? 1 : 0

inputArray
for i in startIndex..<inputArray.count {
    if inputArray[i] > 0 {
        for j in 1...inputArray[i] {
            result += flag ? "1" : "0"
        }
    }
    
    flag = !flag
}

result

