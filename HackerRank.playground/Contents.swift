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

var mat = Matrix(rows: 6, columns: 6)
mat[0, 0] = 0; mat[0, 1] = -4; mat[0, 2] = -6; mat[0, 3] = 0; mat[0, 4] = -7; mat[0, 5] = -6
mat[1, 0] = 0; mat[1, 1] = 1; mat[1, 2] = 0; mat[1, 3] = 0; mat[1, 4] = 0; mat[1, 5] = 0
mat[2, 0] = 1; mat[2, 1] = 1; mat[2, 2] = 1; mat[2, 3] = 0; mat[2, 4] = 0; mat[2, 5] = 0
mat[3, 0] = 0; mat[3, 1] = 0; mat[3, 2] = 2; mat[3, 3] = 4; mat[3, 4] = 4; mat[3, 5] = 0
mat[4, 0] = 0; mat[4, 1] = 0; mat[4, 2] = 0; mat[4, 3] = 2; mat[4, 4] = 0; mat[4, 5] = 0
mat[5, 0] = 0; mat[5, 1] = 0; mat[5, 2] = 1; mat[5, 3] = 2; mat[5, 4] = 4; mat[5, 5] = 0

var max = Int.min

for i in 0...3 {
    for j in 0...3 {
        let next = mat[i, j] + mat[i, j+1] + mat[i, j+2] + mat[i+1, j+1] + mat[i+2, j] + mat[i+2, j+1] + mat[i+2, j+2]
        if next > max {
            max = next
        }
    }
}

print(max)


var array: NSArray = readLine()!.characters.split(" ").map{Int(String($0))!}
for j in 0...array.count {
    mat[j, j] = array[j].integerValue
}
















