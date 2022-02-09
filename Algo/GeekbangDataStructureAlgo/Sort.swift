//
//  Sort.swift
//  GeekbangDataStructureAlgo
//
//  Created by yinlong on 2022/1/28.
//  Copyright © 2022 张银龙. All rights reserved.
//

import Cocoa




// 冒泡排序
func BubbleSort<T>(_ elements: [T]) ->[T] where T: Comparable  {
    guard !elements.isEmpty else { return elements }
    var array = elements
    let count = array.count
    
    for i in 0 ..< count {
        var flag = false // 提前退出冒泡循环的标志位
        for j in 0 ..< count - 1 - i {
            if array[j] > array[j+1] { // 大的放到后面
                array.swapAt(j+1, j)
                flag = true // 表示有数据交换
            }
        }
        if !flag {
            break // 没有数据交换，提前退出
        }
    }
    return array
}

// 插入排序（Insertion Sort）
func InsertionSort<T>(_ elements: [T]) -> [T] where T: Comparable {
    guard !elements.isEmpty else { return elements }
    var array = elements
    
    let count = array.count
    for i in 0 ..< count {
        // 当前需要对比的
        let current = array[i + 1]
        var preIndex = i
        // 寻找插入位置
        while preIndex >= 0, current < array[preIndex] {
            array[preIndex + 1] = array[preIndex]// 数据移动
            preIndex -= 1
        }
        array[preIndex + 1] = current// 找到了插入的位置
    }
    return array
}

// 选择排序（Selection Sort）
func SelectionSort<T>(_ elements: [T]) -> [T] where T: Comparable  {
    guard !elements.isEmpty else { return elements }
    var array = elements
    let count = array.count
    
    for i in 0 ..< count {
        var minIndex = i
        
        for j in i ..< count {
            if array[j] < array[minIndex] { //找到最小的数
                minIndex = j; //将最小数的索引保存
            }
        }
        array.swapAt(minIndex, i)
    }
    
    return array
}

// 归并排序(Merge Sort)
func MergeSort(_ nums: [Int]) -> [Int] {
    guard nums.count >= 2 else { return nums }
    
    let mid = nums.count / 2
    
    let left: [Int] = Array(nums[0..<mid])
    let right: [Int] = Array(nums[mid..<nums.count])
    
    // 归并排序——将两段排序好的数组结合成一个排序数组
    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        let count = left.count + right.count
        var result = Array(repeating: 0, count: count)
        
        var leftIndex:Int = 0
        var rightIndex: Int = 0
        
        for index in 0 ..< count {
            if leftIndex >= left.count {
                result[index] = right[rightIndex]
                rightIndex += 1
            } else if rightIndex >= right.count {
                result[index] = left[leftIndex]
                leftIndex += 1
            } else if left[leftIndex] > right[rightIndex] {
                result[index] = right[rightIndex]
                rightIndex += 1
            } else {
                result[index] = left[leftIndex]
                leftIndex += 1
            }
        }
        
        return result
    }
    
    return merge(MergeSort(left), MergeSort(right))
}

public func mergeSort<T>(_ a: inout T) where T: RandomAccessCollection, T: MutableCollection, T.Element: Comparable {
    
    func mergeSort<T>(_ a: inout T, from low: T.Index, to high: T.Index) where T: RandomAccessCollection, T: MutableCollection, T.Element: Comparable {
        if low >= high { return }
        let dist = a.distance(from: low, to: high)
        let mid = a.index(low, offsetBy: dist/2)
        mergeSort(&a, from: low, to: mid)
        mergeSort(&a, from: a.index(mid, offsetBy: 1), to: high)
        merge(&a, from: low, through: mid, to: high)
    }

    func merge<T>(_ a: inout T, from low: T.Index, through mid: T.Index, to high: T.Index) where T: RandomAccessCollection, T: MutableCollection, T.Element: Comparable {
        var i = low
        var j = a.index(mid, offsetBy: 1)
        var tmp = Array<T.Element>()
        tmp.reserveCapacity(a.distance(from: low, to: high) + 1)
        while i <= mid && j <= high {
            if a[i] <= a[j] {
                tmp.append(a[i])
                a.formIndex(after: &i)
            } else {
                tmp.append(a[j])
                a.formIndex(after: &j)
            }
        }
        
        var start = i
        var end = mid
        if j <= high {
            start = j
            end = high
        }
        tmp.append(contentsOf: a[start...end])
        
        var current = low
        for element in tmp {
            a[current] = element
            a.formIndex(after: &current)
        }
    }
    
    mergeSort(&a, from: a.startIndex, to: a.index(before: a.endIndex))
}


// 快速排序(QuickSort)

public func quickSort<T: RandomAccessCollection & MutableCollection>(_ a: inout T) where T.Element: Comparable {
    func quickSort<T: RandomAccessCollection & MutableCollection>(_ a: inout T, from low: T.Index, to high: T.Index) where T.Element: Comparable {
        if low >= high { return }
        
        let m = partition(&a, from: low, to: high)
        quickSort(&a, from: low, to: a.index(before: m))
        quickSort(&a, from: a.index(after: m), to: high)
    }
    
    func partition<T: RandomAccessCollection & MutableCollection>(_ a: inout T, from low: T.Index, to high: T.Index) -> T.Index where T.Element: Comparable {
        let pivot = a[low]
        var j = low
        var i = a.index(after: low)
        while i <= high {
            if a[i] < pivot {
                a.formIndex(after: &j)
                a.swapAt(i, j)
            }
            a.formIndex(after: &i)
        }
        a.swapAt(low, j)
        return j
    }
    
    quickSort(&a, from: a.startIndex, to: a.index(before: a.endIndex))
}


