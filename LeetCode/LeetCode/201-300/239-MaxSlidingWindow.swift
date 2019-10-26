//
//  239-MaxSlidingWindow.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/10/25.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

/*
 给定一个数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。
 返回滑动窗口中的最大值。

 示例:
 输入: nums = [1,3,-1,-3,5,3,6,7], 和 k = 3
 输出: [3,3,5,5,6,7]
 解释:

   滑动窗口的位置                最大值
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7

 提示：
 你可以假设 k 总是有效的，在输入数组不为空的情况下，1 ≤ k ≤ 输入数组的大小。

 进阶：
 你能在线性时间复杂度内解决此题吗？

 [困难] https://leetcode-cn.com/problems/sliding-window-maximum
 */
class MaxSlidingWindow: NSObject {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        
        if nums.isEmpty || k < 1 { return [] }
        if k == 1 { return nums }
        
        var maxIndex = -1
        var res = [Int]()
        
        for index in 0 ..< nums.count - k + 1 {
            
            if maxIndex < index {
                // 最大值所在位置已经出栈, 重新计算当前 window 中最大值
                maxIndex = index
                
                let currentWindowMaxIndex = index + k - 1
                for j in index ... currentWindowMaxIndex {
                    if nums[j] >= nums[maxIndex] {
                        maxIndex = j
                    }
                }
                
            } else {
                // 最大值在窗口中, 比较即将进栈的值的大小
                let currentWindowMaxIndex = index + k - 1
                if nums[currentWindowMaxIndex] > nums[maxIndex] {
                    maxIndex = index + k - 1
                }
            }
            
            res.append(nums[maxIndex])
        }
        
        return res
    }
}
