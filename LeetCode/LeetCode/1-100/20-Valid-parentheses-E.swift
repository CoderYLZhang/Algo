//
//  Valid-parentheses.swift
//  LeetCode
//
//  Created by 张银龙 on 2020/3/3.
//  Copyright © 2020 张银龙. All rights reserved.
//

import Cocoa

/*
 20. 有效的括号
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。

 示例 1:

 输入: "()"
 输出: true
 示例 2:

 输入: "()[]{}"
 输出: true
 示例 3:

 输入: "(]"
 输出: false
 示例 4:

 输入: "([)]"
 输出: false
 示例 5:

 输入: "{[]}"
 输出: true
 
 [简单] https://leetcode-cn.com/problems/valid-parentheses/
 */

class Valid_parentheses: NSObject {
    func isValid(_ s: String) -> Bool {
        
        let ood = s.count % 2
        guard ood == 0 else { return false }
        
        var stack = [Character]()
        
        for parenthes in s {
            if left.contains(parenthes) {
                // 是左括号 push 右括号
                stack.append(map[parenthes]!)
                
            } else {
                // 是右括号 pop
                // 判断最后添加的元素与现在的是否比匹配
                if let last = stack.popLast() {
                    if parenthes != last {
                        return false
                    }
                } else {
                    return false
                }
                
            }
        }
        
        return stack.isEmpty
    }
    
    lazy var map: [Character: Character] = {
        return [
            "(": ")",
            "[": "]",
            "{": "}"
        ]
    }()
    
    
    lazy var left: [Character] = {
        return ["(", "[", "{"]
    }()
}
