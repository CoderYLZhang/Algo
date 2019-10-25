//
//  155-MinStack.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/10/25.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

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
