//
//  22-GenerateParentheses.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/11/8.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

/*
 给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。

 例如，给出 n = 3，生成结果为：

 [
   "((()))",
   "(()())",
   "(())()",
   "()(())",
   "()()()"
 ]

 https://leetcode-cn.com/problems/generate-parentheses
 */
class GenerateParentheses: NSObject {
    
    func generateParenthesis(_ n: Int) -> [String] {
        
        create(leftCount: 0, rightCount: 0, maxCount: n, current: "")
        
        return parentheses
    }
    
    func create(leftCount: Int, rightCount: Int, maxCount: Int, current: String) {
        if leftCount == maxCount, rightCount == maxCount {
            parentheses.append(current)
            return
        }
        
        if leftCount < maxCount {
            create(leftCount: leftCount + 1, rightCount: rightCount, maxCount: maxCount, current: current + "(")
        }
        
        if rightCount < leftCount {
            create(leftCount: leftCount, rightCount: rightCount + 1, maxCount: maxCount, current: current + ")")
        }
    }
    
    var parentheses = [String]()
}
