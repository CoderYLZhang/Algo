//
//  46-Permutations-M.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/11/16.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

/*
 47. 全排列 II
 给定一个可包含重复数字的序列，返回所有不重复的全排列。

 示例:

 输入: [1,1,2]
 输出:
 [
   [1,1,2],
   [1,2,1],
   [2,1,1]
 ]

 链接：https://leetcode-cn.com/problems/permutations-ii
 */

extension Permutations {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        
        func permute(_ nums: inout [Int], start: Int, result: inout [[Int]]) {
            if start == nums.count - 1 {
                result.append(nums)
                return
            }
            
            var set = Set<Int>()
            for i in start ..< nums.count {
                if set.insert(nums[i]).inserted {
                    nums.swapAt(i, start)
                    permute(&nums, start: start + 1, result: &result)
                    nums.swapAt(i, start)
                }
            }
        }
        
        var nums = nums
        var result = [[Int]]()
        permute(&nums, start: 0, result: &result)
        return result
    }
}
