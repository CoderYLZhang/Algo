//
//  20-validParentheses.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/10/25.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa
/*
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。

 链接：https://leetcode-cn.com/problems/valid-parentheses
 */
class ValidParentheses: NSObject {
    
    func isValid(_ s: String) -> Bool {
        
        let map : [String : String] = [
            ")" : "(",
            "]" : "[",
            "}" : "{",
            ]
        
        var stack = [String]()
        let right = [")","]", "}"]
        
        for p in s {
            
            let parentheses = String(p)
            
            if right.contains(parentheses) {
                
                if stack.isEmpty { return false }
                
                if map[parentheses] == stack.last {
                    stack.removeLast()
                } else {
                    return false
                }
                
            } else {
                stack.append(parentheses)
            }
        }
        
        return stack.isEmpty
    }
    
    func isValid_2(_ s: String) -> Bool {
        
        let map : [Character : Character] = [
            "(" : ")",
            "[" : "]",
            "{" : "}",
            ]
        
        var stack = [Character]()
        let left: [Character] = ["(", "[", "{"]
        
        for parentheses in s {
            
            if left.contains(parentheses) {

                // 遇到左括号,将对应的右括号加入栈
                stack.append(map[parentheses]!)
                
            } else {
                
                if stack.isEmpty { return false }
                
                if parentheses == stack.last {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
        
        return stack.isEmpty
    }
}
