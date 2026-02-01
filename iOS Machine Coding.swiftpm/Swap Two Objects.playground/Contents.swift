import UIKit

// LEARINIGS: Arguments in swift are immutable we cannot change it
// if you want to make the argument to be mutable then mark it as inout
// Also inout passes the argument as a reference type

var name1 = "Vedant"
var name2 = "Ved"

print("Name1 is now:- \(name1)")
print("Name1 is now:- \(name2)")

swap(&name1, &name2)

var num1 = 5
var num2 = 10

print("Num1 is now:- \(num1)")
print("Num2 is now:- \(num2)")

swap(&num1, &num2)


func swap<T : Equatable>(a : inout T, b : inout T) -> Void {
    var temp = b
    b = a
    a = temp
}

print("After swap Name1 is:- \(name1)")
print("After swap Name1 is:- \(name2)")

print("After swap num1 is:- \(num1)")
print("After swap num2 is:- \(num2)")

var nums = [10, 12, 19]

swapNumbersInArray(array: &nums, i: 0, j: 2)

func swapNumbersInArray<T: Equatable>(array: inout [T], i: Int, j: Int) {
    var temp = array[j]
    array[j] = array[i]
    array[i] = temp
}

print(nums)
