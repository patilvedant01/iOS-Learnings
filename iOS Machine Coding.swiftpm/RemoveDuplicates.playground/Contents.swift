import UIKit

var nums = [23, 23, 23, 12, 122, 12, 11, 11, 144]

removeDuplicates(array: &nums)

print(nums)

var chars = ["a", "a", "z", "y", "y", "i"]

removeDuplicates(array: &chars)

print(chars)

func removeDuplicates<T: Hashable>(array: inout [T]) {
    var set = Set<T>()
    
    var ptr = 0
    for val in array {
        if !set.contains(val) {
            array[ptr] = val
            ptr += 1
            set.insert(val)
        }
    }
    
    array.removeLast(array.count - ptr)
}
