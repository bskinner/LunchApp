import UIKit
import Dispatch

var firstItems = [
    "one",
    "two",
    "three"
]

var secondItems = [
    "four",
    "five",
    "six"
]

let append = firstItems + secondItems
let interleaveOdd = (0..<max(firstItems.count, secondItems.count)).reduce([String]()) { result, index in
    var items = result
    if index < firstItems.count {
        items.append(firstItems[index])
    }

    if index < secondItems.count {
        items.append(secondItems[index])
    }

    return items
}

let interleaveEven = (0..<max(firstItems.count, secondItems.count)).reduce([String]()) { result, index in
    var items = result
    if index < secondItems.count {
        items.append(secondItems[index])
    }

    if index < firstItems.count {
        items.append(firstItems[index])
    }

    return items
}

var orderedSet = NSMutableOrderedSet(array: firstItems)

orderedSet.union(NSOrderedSet(array: secondItems))

guard let elements = orderedSet.array as? [String] else {
    print("unable to recovery typing")
    fatalError()
}

if elements.elementsEqual(append, by: ==) {
    print("union by appending")
}
else if elements.elementsEqual(interleaveOdd, by: ==) {
    print("union by interleaving odd")
}
else if elements.elementsEqual(interleaveEven, by: ==) {
    print("union by interleaving even")
}
else {
    print("using some other merge pattern")
}

let qiOne = URLQueryItem(name: "one", value: "two")
let qiTwo = URLQueryItem(name: "one", value: "three")
if qiOne == qiTwo {
    print("only name matters")
}
else {
    print("name and value matters")
}

