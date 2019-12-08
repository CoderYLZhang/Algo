//
//  169-MajorityElement-E.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/12/8.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

/*
 169. 多数元素
 给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。

 你可以假设数组是非空的，并且给定的数组总是存在多数元素。

 示例 1:

 输入: [3,2,3]
 输出: 3
 示例 2:

 输入: [2,2,1,1,1,2,2]
 输出: 2

 链接：https://leetcode-cn.com/problems/majority-element
 */

class MajorityElement: NSObject {
    func majorityElement(_ nums: [Int]) -> Int {
        var count = 0
        var value = -1
        
        for v in nums {
            if count == 0 {
                value = v
            }
            
            count = (value == v) ? count + 1 : count - 1
        }
        
        return value
    }
}
