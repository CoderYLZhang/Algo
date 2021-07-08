//
//  18-4Sum-M.swift
//  LeetCode
//
//  Created by yinlong on 2021/7/8.
//  Copyright © 2021 张银龙. All rights reserved.
//

import Foundation

/*
 给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。

 注意：答案中不可以包含重复的四元组。

 示例 1：

 输入：nums = [1,0,-1,0,-2,2], target = 0
 输出：[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 示例 2：

 输入：nums = [], target = 0
 输出：[]
 
 提示：

 0 <= nums.length <= 200
 -109 <= nums[i] <= 109
 -109 <= target <= 109

 链接：https://leetcode-cn.com/problems/4sum
 
 */


class FourSum: NSObject {
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        
        guard nums.count > 3 else { return [] }
        
        var res = [[Int]]()
        
        let soredNums = nums.sorted()
        let count = nums.count
        
        // 第一个
        for firstIndex in 0 ..< count - 3 {
    
            let firstValue = soredNums[firstIndex]
            
            // 去重
            if firstIndex > 0, firstValue == soredNums[firstIndex - 1] {
                continue
            }
            
            // 第二个
            for secondIndex in firstIndex + 1 ..< count - 2 {
                
                let secondValue = soredNums[secondIndex]
                
                // 去重
                if secondIndex > firstIndex + 1, secondValue == soredNums[secondIndex - 1] {
                    continue
                }
                // 双指针
                var left = secondIndex + 1
                var right = count - 1
                
                while left < right {
                    // 比较和
                    let sum = firstValue + secondValue + soredNums[left] + soredNums[right]
                    
                    if sum < target {
                        left += 1
                    } else if sum > target {
                        right -= 1
                    } else {
                        res.append([firstValue, secondValue, soredNums[left], soredNums[right]])
                        
                        // 去重
                        while left < right, soredNums[left] == soredNums[left + 1] {
                            left += 1
                        }
                        
                        while left < right, soredNums[right] == soredNums[right - 1] {
                            right -= 1
                        }
                        
                        left += 1
                        right -= 1
                    }
                }
            }
        }
        
        return res
    }
}
