//
//  78-Subsets-M.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/12/4.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

/*
 78. 子集
 
 给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

 说明：解集不能包含重复的子集。

 示例:

 输入: nums = [1,2,3]
 输出:
 [
   [3],
   [1],
   [2],
   [1,2,3],
   [1,3],
   [2,3],
   [1,2],
   []
 ]

 链接：https://leetcode-cn.com/problems/subsets
 */

class Subsets: NSObject {

    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        for num in nums {
            let path = [num]
            for r in result {
                var r = r
                r.append(num)
                result.append(r)
            }
            result.append(path)
        }
        result.append([])
        return result
    }
}
