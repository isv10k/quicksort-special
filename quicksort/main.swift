//
//  main.swift
//  quicksort
//
//  Created by Sergey Ilchenko on 13.10.2019.
//  Copyright © 2019 Sergey Ilchenko. All rights reserved.
//

import Foundation

let count = readLine()
let digitsString = readLine()
var digits = digitsString!.compactMap{Int(String($0))}

func partition(array: inout [Int], startIndex: Int, endIndex: Int) -> Int {
    
    var pivotIndex = startIndex
    let pivot = array[endIndex]
    // ...
    for index in startIndex..<endIndex {
        if array[index] % 3 == 0 && pivot % 3 == 0 && array[index] < pivot {
            array.swapAt(index, pivotIndex)
            pivotIndex += 1
        }
        if array[index] % 3 == 0 && pivot % 3 != 0 && (array[index] < pivot || array[index] > pivot) {
            array.swapAt(index, pivotIndex)
            pivotIndex += 1
        }
        if array[index] % 3 != 0 && pivot % 3 != 0 && array[index] < pivot {
            array.swapAt(index, pivotIndex)
            pivotIndex += 1
        }
    }
    array.swapAt(pivotIndex, endIndex)
    return pivotIndex
}

func quickSort(array: inout [Int], startIndex: Int, endIndex: Int) -> [Int] {
    if startIndex < endIndex {
        let pivot  = partition(array: &array, startIndex: startIndex, endIndex: endIndex)
        quickSort(array: &array, startIndex: startIndex, endIndex: pivot - 1)
        quickSort(array: &array, startIndex: pivot + 1, endIndex: endIndex)
    }
    // return array.filter{$0 % 3 == 0} + array.filter{$0 % 3 != 0}
    return array
    
}

var d = quickSort(array: &digits, startIndex: 0, endIndex: digits.count-1)
print(d)

