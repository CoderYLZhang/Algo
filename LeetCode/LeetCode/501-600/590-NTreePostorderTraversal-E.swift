//
//  590-NTreePostorderTraversal.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/10/30.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa
/*
590. N叉树的后序遍历
 给定一个 N 叉树，返回其节点值的后序遍历。
  
 返回其后序遍历: [5,6,3,2,4,1].
 
 [简单] https://leetcode-cn.com/problems/n-ary-tree-postorder-traversal/
 */
class NTreePostorderTraversal: NSObject {
    func postorder(_ root: Node?) -> [Int] {
        var result: [Int] = []
        
        func traversal(_ root: Node?) {
            guard let root = root else { return }
            guard let children = root.children else {
                result.append(root.val)
                return
            }
            
            for node in children {
                traversal(node)
            }
            
            result.append(root.val)
            
        }
        
        traversal(root)
        
        return result
    }
}
