//
//  46-Permutations-M.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/11/16.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

/*
 46. 全排列
 给定一个没有重复数字的序列，返回其所有可能的全排列。

 示例:

 输入: [1,2,3]
 输出:
 [
   [1,2,3],
   [1,3,2],
   [2,1,3],
   [2,3,1],
   [3,1,2],
   [3,2,1]
 ]

 链接：https://leetcode-cn.com/problems/permutations
 */

class Permutations: NSObject {
    func permute(_ nums: [Int]) -> [[Int]] {
        
        guard nums.count > 1 else { return [nums] }
        
        func permute(_ nums: inout [Int], start: Int, result: inout [[Int]]) {
            
            if start + 1 >= nums.count {
                result.append(nums)
                return
            }
            
            for i in start ..< nums.count {
                
                nums.swapAt(i, start)
                permute(&nums, start: start + 1, result: &result)
                nums.swapAt(i, start)
            }
            
        }
        
        var result = [[Int]]()
        var nums = nums
        permute(&nums, start: 0, result: &result)
        
        return result
    }
}
