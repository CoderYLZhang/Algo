//
//  22-GenerateParentheses.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/11/8.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

class GenerateParentheses: NSObject {
    
    func generateParenthesis(_ n: Int) -> [String] {
        
        create(0, rightCount: 0, maxCount: n, current: "")
        
        return parentheses
    }
    
    func create(_ leftCount: Int, rightCount: Int, maxCount: Int, current: String) {
        if leftCount == maxCount, rightCount == maxCount {
            parentheses.append(current)
            return
        }
        
        if leftCount < maxCount {
            create(leftCount + 1, rightCount: rightCount, maxCount: maxCount, current: current + "(")
        }
        
        if rightCount < leftCount {
            create(leftCount, rightCount: rightCount + 1, maxCount: maxCount, current: current + ")")
        }
    }
    
    var parentheses = [String]()
}
