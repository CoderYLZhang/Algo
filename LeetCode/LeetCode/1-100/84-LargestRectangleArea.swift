//
//  84-LargestRectangleArea.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/10/25.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

/*
 给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。

 求在该柱状图中，能够勾勒出来的矩形的最大面积。
 
 
 [困难] https://leetcode-cn.com/problems/largest-rectangle-in-histogram
 
 */

class LargestRectangleArea: NSObject {
    // O(n^2)
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var maxArea = 0
        
        let count = heights.count
        
        for left in 0 ..< count {
            var minHight = Int.max
            for right in left ..< count {
                minHight = min(minHight, heights[right])
                maxArea = max(maxArea, minHight * (right - left + 1))
            }
        }
        return maxArea
    }
    // 使用栈
    func largestRectangleArea_stack(_ heights: [Int]) -> Int {
        
        // 处理只有一个数据的情况
        var heights = heights
        heights.append(0)
        
        var stack: [Int] = []
        var maxArea = 0
        
        for i in heights.indices {
            
            // 当前高度小于上一次, 说明找到了右边界, 出栈, 计算面积
            while !stack.isEmpty,
                  heights[i] <= heights[stack.last!] {
                
                let height = heights[stack.removeLast()]
                var span = i
                if !stack.isEmpty {
                    span = i - stack.last! - 1
                }
                
                maxArea = max(maxArea, span * height)
            }
            
            stack.append(i)
            
        }
        
        return maxArea
    }
}
