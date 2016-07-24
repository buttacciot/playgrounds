//: Playground - noun: a place where people can play

import Foundation

// MARK: - Iterating String
let camel: NSString = "Some Sring"
let range = NSRange(location: 0, length: camel.length)
let len = camel.length
var buffer = Array<unichar>(count: len+1, repeatedValue: 0)
camel.getCharacters(&buffer, range: range)
for i in 0..<len {
    let current = buffer[i]
}

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