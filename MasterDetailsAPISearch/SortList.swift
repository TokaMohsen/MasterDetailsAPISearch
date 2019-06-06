//
//  SortList.swift
//  MasterDetailsAPISearch
//
//  Created by ToqaMohsen on 6/4/19.
//  Copyright © 2019 Toqa. All rights reserved.
//

import Foundation
class SortList {

    //incase of large arrays
  func mergeSort(_ array: [movies]) -> [movies] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}

func merge(_ left: [movies], _ right: [movies]) -> [movies] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [movies] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement.rating! > rightElement.rating! {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement.rating! < rightElement.rating! {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else {
           
            orderedArray.append(rightElement)
            rightIndex += 1
            orderedArray.append(leftElement)
            leftIndex += 1
        }
    }
    
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}
    // incase of small arrays
    func insertionSort(a: [movies]) -> [movies] {
        guard a.count > 1 else { return a } // If have 1 or less items, we're already finished
        
        var b = a
        for i in 1..<b.count {
            var y = i
            while y > 0 && b[y].rating! < b[y - 1].rating! {
                b.swapAt(y - 1, y)
                y -= 1
            }
        }
        return b
    }
    
}
