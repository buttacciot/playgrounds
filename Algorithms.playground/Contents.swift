//: Playground - noun: a place where people can play

import UIKit


// Data Structures
public struct Stack<T> {
    private var array = [T]()
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return isEmpty ? nil : array.removeLast()
    }
    
    public func peek() -> T? {
        return isEmpty ? nil : array.last
    }
}

var myStack = Stack<String>()
myStack.push("Frank")
myStack.push("Janet")
myStack.push("Steve")
print(myStack.pop())

public struct SimpleQueue<T> {
    private var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(element: T) {
        array.append(element)
    }
    
    // Shifts all elements in array to left every dequeue; O(n) on average
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
    
    public func peek() -> T? {
        return array.first
    }
}

var myQueue = SimpleQueue<String>()
myQueue.enqueue("Frank")
myQueue.enqueue("Janet")
myQueue.enqueue("Steve")
print(myQueue.dequeue())

public struct BetterQueue<T> {
    private var array = [T?]()
    private var head: Int = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(element: T) {
        array.append(element)
    }
    
    // Shift contents to front of array only after condition is met; O(1) on average
    public mutating func dequeue() -> T? {
        guard head < count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        if count > 50 && Double(head)/Double(count) > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    public func peek() -> T? {
        return isEmpty ? nil : array[head]
    }
}

// Sorting
func insertionSort<T>(inout array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    for x in 1..<array.count {
        var y = x
        let temp = array[y]
        while y > 0 && isOrderedBefore(temp, array[y-1]) {
            array[y] = array[y - 1]
            y -= 1
        }
        array[y] = temp
    }
    return array
}

var nums = [5, 2, 8, 1, 3]
print(insertionSort(&nums, <))

var strings = ["Pete", "Allen", "Banana", "Kiwi"]
print(insertionSort(&strings, <))


// Searching
// Binary Search
func binarySearch<T: Comparable>(a: [T], key: T, range: Range<Int>) -> Int? {
    if range.startIndex >= range.endIndex {
        return nil
    } else {
        let midIndex = range.startIndex + (range.endIndex - range.startIndex) / 2
        
        if a[midIndex] > key {
            return binarySearch(a, key: key, range: range.startIndex ..< midIndex)
        } else if a[midIndex] < key {
            return binarySearch(a, key: key, range: midIndex + 1 ..< range.endIndex)
        } else {
            return midIndex
        }
    }
}

let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
binarySearch(numbers, key: 43, range: 0 ..< numbers.count)  // gives 13

// Binary Search Tree

public enum BinarySearchTree<T: Comparable> {
    case Empty
    case Leaf(T)
    indirect case Node(BinarySearchTree, T, BinarySearchTree)
    
    public var count: Int {
        switch self {
        case .Empty: return 0
        case .Leaf: return 1
        case let .Node(left, _, right): return left.count + 1 + right.count
        }
    }
    
    public var height: Int {
        switch self {
        case .Empty: return 0
        case .Leaf: return 1
        case let .Node(left, _, right): return 1 + max(left.height, right.height)
        }
    }
    
    public func insert(newValue: T) -> BinarySearchTree {
        switch self {
        case .Empty:
            return .Leaf(newValue)
            
        case .Leaf(let value):
            if newValue < value {
                return .Node(.Leaf(newValue), value, .Empty)
            } else {
                return .Node(.Empty, value, .Leaf(newValue))
            }
            
        case .Node(let left, let value, let right):
            if newValue < value {
                return .Node(left.insert(newValue), value, right)
            } else {
                return .Node(left, value, right.insert(newValue))
            }
        }
    }
    
    public func search(x: T) -> BinarySearchTree? {
        switch self {
        case .Empty:
            return nil
        case .Leaf(let y):
            return (x == y) ? self : nil
        case let .Node(left, y, right):
            if x < y {
                return left.search(x)
            } else if y < x {
                return right.search(x)
            } else {
                return self
            }
        }
    }
}

extension BinarySearchTree: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .Empty: return "."
        case .Leaf(let value): return "\(value)"
        case .Node(let left, let value, let right):
            return "(\(left.debugDescription) <- \(value) -> \(right.debugDescription))"
        }
    }
}


//var tree = BinarySearchTree.Leaf(7)
//tree = tree.insert(2)
//tree = tree.insert(5)
//tree = tree.insert(10)
//tree = tree.insert(9)
//tree = tree.insert(1)

//tree.search(10)?.debugDescription

//tree.debugDescription


public enum BST<T: Comparable> {
    case Empty
    case Leaf(T)
    indirect case Node(BST, T, BST)
    
    public var count: Int {
        switch self {
        case .Empty: return 0
        case .Leaf: return 1
        case .Node(let left, _, let right):
            return left.count + 1 + right.count
        }
    }
    
    public var height: Int {
        switch self {
        case .Empty: return 0
        case .Leaf: return 1
        case .Node(let left, _, let right):
            return 1 + max(left.height, right.height)
        }
    }
    
    public func insert(newValue: T) -> BST {
        switch self {
        case .Empty: return Leaf(newValue)
        case .Leaf(let value):
            if newValue < value {
                return Node(Leaf(newValue), value, Empty)
            } else {
                return Node(Empty, value, Leaf(newValue))
            }
        case .Node(let left, let value, let right):
            if newValue < value {
                return Node(left.insert(newValue), value, right)
            } else {
                return Node(left, value, right.insert(newValue))
            }
        }
    }
    
    public func search(x: T) -> BST? {
        switch self {
        case .Empty: return nil
        case .Leaf(let y):
            return (x == y) ? self : nil
        case .Node(let left, let y, let right):
            if x < y {
                return left.search(x)
            } else if x > y {
                return right.search(x)
            } else {
                return self
            }
        }
    }
}

extension BST: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .Empty: return "."
        case .Leaf(let value): return "\(value)"
        case .Node(let left, let value, let right):
            return "(\(left.debugDescription)  <- \(value) -> \(right.debugDescription))"
        }
    }
}


var tree = BST.Leaf(7)
tree = tree.insert(2)
tree = tree.insert(5)
tree = tree.insert(10)
tree = tree.insert(9)
tree = tree.insert(1)


print(tree.debugDescription)









