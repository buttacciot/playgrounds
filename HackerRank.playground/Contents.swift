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
}

let count = 5
let rotations = 6

var arr: NSArray = NSArray(arrayLiteral: 1, 2, 3, 4, 5)

func printArray(arr: NSArray, startAt: Int) {
    
    var idx = startAt
    for _ in 0..<arr.count {
        print(arr[idx], terminator: " ")
        idx += 1
        if idx >= arr.count { idx = 0 }
    }
}

if count == rotations {
    printArray(arr, startAt: 0)
} else if count > rotations {
    printArray(arr, startAt: rotations)
} else {
    let start = rotations % count
    printArray(arr, startAt: start)
}














