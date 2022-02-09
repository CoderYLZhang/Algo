//
//  77-Combinations-M.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/11/15.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

/*
 77. 组合
 给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。

 示例:

 输入: n = 4, k = 2
 输出:
 [
   [2,4],
   [3,4],
   [2,3],
   [1,2],
   [1,3],
   [1,4],
 ]

 链接：https://leetcode-cn.com/problems/combinations
 */

class Combinations: NSObject {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        
        var res = [[Int]]()
        var data = [Int](repeating: 0, count: k)
        // 当前更新的位数
        var i = 0
    
        while data[0] <= (n - k + 1) {
            
            data[i] += 1
            if data[i] > n {
                // 下次循环将进位
                i -= 1
            } else if i == (k - 1) {
                res.append(data)
            } else {
                i += 1
                data[i] = data[i - 1]
            }
        }
        
        return res
    }
}
