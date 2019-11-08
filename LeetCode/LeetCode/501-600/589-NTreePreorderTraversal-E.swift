//
//  589-NTreePostorderTraversal.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/10/30.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa
/*
 589. N叉树的前序遍历
 给定一个 N 叉树，返回其节点值的后序遍历。
  
 返回其前序遍历: [1,3,5,6,2,4]。
 
 [简单] https://leetcode-cn.com/problems/n-ary-tree-preorder-traversal/description/
 */
class NTreePreorderTraversal: NSObject {
    func preorder(_ root: Node?) -> [Int] {
        var result: [Int] = []
        
        func traversal(_ root: Node?) {
            guard let root = root else { return }
            guard let children = root.children else {
                result.append(root.val)
                return
            }
            
            result.append(root.val)

            for node in children {
                traversal(node)
            }
        }
        
        traversal(root)
        
        return result
    }
}
