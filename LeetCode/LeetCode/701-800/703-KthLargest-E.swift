//
//  KthLargest.swift
//  LeetCode
//
//  Created by 张银龙 on 2020/3/5.
//  Copyright © 2020 张银龙. All rights reserved.
//

import Cocoa

/*
 703. 数据流中的第K大元素
 设计一个找到数据流中第K大元素的类（class）。注意是排序后的第K大元素，不是第K个不同的元素。

 你的 KthLargest 类需要一个同时接收整数 k 和整数数组nums 的构造器，它包含数据流中的初始元素。每次调用 KthLargest.add，返回当前数据流中第K大的元素。

 示例:

 int k = 3;
 int[] arr = [4,5,8,2];
 KthLargest kthLargest = new KthLargest(3, arr);
 kthLargest.add(3);   // returns 4
 kthLargest.add(5);   // returns 5
 kthLargest.add(10);  // returns 5
 kthLargest.add(9);   // returns 8
 kthLargest.add(4);   // returns 8
 说明:
 你可以假设 nums 的长度≥ k-1 且k ≥ 1。
 
 [简单] https://leetcode-cn.com/problems/kth-largest-element-in-a-stream/
 */

class KthLargest {
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.nums = Array(nums.sorted(by: >).prefix(k))
    }
    
    func add(_ val: Int) -> Int {
        if let last = nums.last {
            if last > val {
                nums.append(val)
            } else {
                let index = binarySearch(val)
                nums.insert(val, at: index)
            }
        } else {
            nums.append(val)
        }
        if nums.count > k {
            nums.removeLast()
        }
        return nums.last!
    }
    
    private func binarySearch(_ val: Int) -> Int {
        var start = 0
        var end = nums.count - 1
        while start <= end {
            let mid = start + (end - start) / 2
            if nums[mid] > val {
                start = mid + 1
            } else if nums[mid] < val {
                end = mid - 1
            } else {
                return mid
            }
        }
        return start
    }
    
    let k: Int
    var nums = [Int]()
}
