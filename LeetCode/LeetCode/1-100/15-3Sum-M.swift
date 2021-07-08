//
//  15-3Sum.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/10/20.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

/*:
 15.三数之和
 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
 
 注意：答案中不可以包含重复的三元组。
 
 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 
 
 满足要求的三元组集合为：
 
 [
 
 [-1, 0, 1],
 
 [-1, -1, 2]
 
 ]
 
 [中等](https://leetcode.com/problems/3sum)
 
 */
class ThreeSum: NSObject {

    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        let count = nums.count
        if count < 3 { return [] }
        
        var allResult: [[Int]] = []
        
        // 排序
        let sortedNums = nums.sorted()
        
        for index in 0 ..< count - 2 {
            
            let value = sortedNums[index]
                
            // 去重
            if index > 0, value == sortedNums[index - 1] {
                continue
            }
            
            var left = index + 1
            var right = count - 1
            
            // 双指针
            while left < right {
                // 计算和
                let sum = value + sortedNums[left] + sortedNums[right]
                
                if sum < 0 {
                    left += 1
                } else if sum > 0 {
                    right -= 1
                } else {
                    // 存储结果
                    allResult.append([value, sortedNums[left], sortedNums[right]])
                    
                    // 去重
                    while left < right, sortedNums[left] == sortedNums[left + 1] {
                        left += 1
                    }
                    
                    while left < right, sortedNums[right] == sortedNums[right - 1] {
                        right -= 1
                    }
                    
                    right -= 1
                    left += 1
                }
            }
        }
        
        return allResult
    }
}
