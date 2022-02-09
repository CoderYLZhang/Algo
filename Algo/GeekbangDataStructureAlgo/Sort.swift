//
//  Sort.swift
//  GeekbangDataStructureAlgo
//
//  Created by yinlong on 2022/1/28.
//  Copyright © 2022 张银龙. All rights reserved.
//

import Cocoa




// 冒泡排序
func BubbleSort(_ nums: [Int]) -> [Int] {
    guard !nums.isEmpty else { return nums }
    var nums = nums
    let count = nums.count
    
    for i in 0 ..< count {
        var flag = false // 提前退出冒泡循环的标志位
        for j in 0 ..< count - 1 - i {
            if nums[j+1] > nums[j] {
                nums.swapAt(j+1, j)
                flag = true // 表示有数据交换
            }
        }
        if !flag {
            break // 没有数据交换，提前退出
        }
    }
    return nums
}

// 插入排序（Insertion Sort）
func InsertionSort(_ nums: [Int]) -> [Int] {
    guard !nums.isEmpty else { return nums }
    var nums = nums
    
    let count = nums.count
    var current: Int = 0
    for i in 0 ..< count {
        // 当前需要对比的
        current = nums[i + 1]
        var preIndex = i
        // 寻找插入位置
        while preIndex >= 0, current < nums[preIndex] {
            nums[preIndex + 1] = nums[preIndex]// 数据移动
            preIndex -= 1
        }
        nums[preIndex + 1] = current// 找到了插入的位置
    }
    return nums
}

// 选择排序（Selection Sort）
func SelectionSort(_ nums: [Int]) -> [Int] {
    guard !nums.isEmpty else { return nums }
    var nums = nums
    let count = nums.count
    
    for i in 0 ..< count {
        var minIndex = i
        
        for j in i ..< count {
            if nums[j] < nums[minIndex] { //找到最小的数
                minIndex = j; //将最小数的索引保存
            }
        }
        nums.swapAt(minIndex, i)
    }
    
    return nums
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
