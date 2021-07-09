//
//  50-PowXN-M.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/12/3.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

/*
 50. Pow(x, n)
 
 实现 pow(x, n) ，即计算 x 的 n 次幂函数。

 示例 1:

 输入: 2.00000, 10
 输出: 1024.00000
 示例 2:

 输入: 2.10000, 3
 输出: 9.26100
 示例 3:

 输入: 2.00000, -2
 输出: 0.25000
 解释: 2-2 = 1/22 = 1/4 = 0.25
 说明:

 -100.0 < x < 100.0
 n 是 32 位有符号整数，其数值范围是 [−231, 231 − 1] 。

 链接：https://leetcode-cn.com/problems/powx-n
 */

class PowXN: NSObject {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var x = x
        var n = n
        
        if n < 0 {
            n = -n
            x = 1 / x
        }
        
        var pow: Double = 1
        
        while n > 0 {
            // O(logN)
            // 奇数
            if n & 1 == 1 {
                pow *= x
            }
            
            x *= x
            n /=  2
        }
        
        return pow
    }
}
