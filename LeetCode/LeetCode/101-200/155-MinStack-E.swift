//
//  155-MinStack.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/10/25.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa
/*
 155. 最小栈
 设计一个支持 push，pop，top 操作，并能在常数时间内检索到最小元素的栈。

 push(x) -- 将元素 x 推入栈中。
 pop() -- 删除栈顶的元素。
 top() -- 获取栈顶元素。
 getMin() -- 检索栈中的最小元素。
 示例:

 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> 返回 -3.
 minStack.pop();
 minStack.top();      --> 返回 0.
 minStack.getMin();   --> 返回 -2.

 
[简单] https://leetcode-cn.com/problems/min-stack
 
 */
class MinStack {

    /** initialize your data structure here. */
    init() { }
    
    func push(_ x: Int) {
        topValue = x
        stack.append(x)
        if minStack.isEmpty {
            minStack.append(x)
        } else {
            let minValue: Int = min(minStack.last!, x)
            minStack.append(minValue)
        }
    }
    
    func pop() {
        stack.removeLast()
        minStack.removeLast()
        if let last = stack.last {
            topValue = last
        }
    }
    
    func top() -> Int {
        return topValue
    }
    
    func getMin() -> Int {
        return minStack.last!
    }
    
    private var stack: [Int] = []
    
    private var minStack: [Int] = []
    
    private var topValue: Int = 0
    
}
