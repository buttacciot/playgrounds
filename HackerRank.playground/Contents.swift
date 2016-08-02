//: Playground - noun: a place where people can play

import Foundation

// MARK: - Read line into array
// var array: NSArray = readLine()!.characters.split(" ").map{Int(String($0))!}

// MARK: - Iterating String
//let camel: NSString = "Some Sring"
//let range = NSRange(location: 0, length: camel.length)
//let len = camel.length
//var buffer = Array<unichar>(count: len+1, repeatedValue: 0)
//camel.getCharacters(&buffer, range: range)
//for i in 0..<len {
//    let current = buffer[i]
//}

// MARK: - Bit Shifting
func highestOneBit(v: UInt64) -> UInt64 {
    var v = v
    v |= (v >> 1)
    v |= (v >> 2)
    v |= (v >> 4)
    v |= (v >> 8)
    v |= (v >> 16)
    return v - (v >> 1)
}

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Int]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0)
    }
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Int {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
    
    func isMagicSquare() -> Bool {
        return
            self[0, 0] + self[0, 1] + self[0, 2] == 15 &&
            self[1, 0] + self[1, 1] + self[1, 2] == 15 &&
            self[2, 0] + self[2, 1] + self[2, 2] == 15 &&
            self[0, 0] + self[1, 1] + self[2, 2] == 15 &&
            self[0, 2] + self[1, 1] + self[2, 0] == 15
    }
    
    func missingNumbers() -> [Int] {
        var all = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        for i in 0...2 {
            for j in 0...2 {
                let next = self[i, j]
                if all.contains(next) {
                    all = all.filter { $0 != next }
                }
            }
        }
        return all
    }
    
    static func cost(mat1: Matrix, mat2: Matrix) -> Int {
        var cost = 0
        for i in 0...2 {
            for j in 0...2 {
                cost += abs(mat1[i, j] - mat2[i, j])
            }
        }
        return cost
    }
}

var notPerfect = Matrix(rows: 3, columns: 3)
//notPerfect[0, 0] = 4
//notPerfect[0, 1] = 9
//notPerfect[0, 2] = 2
//notPerfect[1, 0] = 3
//notPerfect[1, 1] = 5
//notPerfect[1, 2] = 7
//notPerfect[2, 0] = 8
//notPerfect[2, 1] = 1
//notPerfect[2, 2] = 5
notPerfect[0, 0] = 4
notPerfect[0, 1] = 4
notPerfect[0, 2] = 4
notPerfect[1, 0] = 4
notPerfect[1, 1] = 4
notPerfect[1, 2] = 4
notPerfect[2, 0] = 4
notPerfect[2, 1] = 4
notPerfect[2, 2] = 4

var perfect = notPerfect
if notPerfect[1, 1] != 5 {
    perfect[1, 1] = 5
}

let missingNumbers = notPerfect.missingNumbers()

// Corners are evens
missingNumbers.forEach { number in
    if number % 2 == 0 {
        if perfect[0, 0] % 2 != 0 {
            perfect[0, 0] = number
        }
        if perfect[0, 2] % 2 != 0 {
            perfect[0, 2] = number
        }
        if perfect[2, 0] % 2 != 0 {
            perfect[2, 0] = number
        }
        if perfect[2, 2] % 2 != 0 {
            perfect[2, 2] = number
        }
    } else {
        if perfect[1, 0] % 2 != 1 {
            perfect[1, 0] = number
        }
        if perfect[0, 1] % 2 != 1 {
            perfect[0, 1] = number
        }
        if perfect[2, 1] % 2 != 1 {
            perfect[2, 1] = number
        }
        if perfect[1, 2] % 2 != 1 {
            perfect[1, 2] = number
        }
    }
}

//print(perfect)
//print(Matrix.cost(notPerfect, mat2: perfect))

func power(x: UInt64, y: UInt64) -> UInt64 {
    var temp: UInt64
    if y == 0 {
        return 1
    }
    temp = power(x, y: y/2)
    if y%2 == 0 {
        return temp*temp
    } else {
        return x*temp*temp
    }
}

let growthA = 2
let growthB = 4
let mills = power(10, y: 18)
let mod = power(10, y: 9)

let thing = UInt64(growthA+growthB)

//print(mills)
//print(power(10, y: 18))
//let final = power(2, y: 10000)

print(power(10, y: 18))

//print(final)
//print(Double(final % (pow(10, 9) + 7)))

























