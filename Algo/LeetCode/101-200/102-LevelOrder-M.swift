//
//  102-LevelOrder-M.swift
//  LeetCode
//
//  Created by yinlong on 2021/7/12.
//  Copyright © 2021 张银龙. All rights reserved.
//

import Foundation
/*
 102. 二叉树的层序遍历
 给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。

  

 示例：
 二叉树：[3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其层序遍历结果：

 [
   [3],
   [9,20],
   [15,7]
 ]
 
 https://leetcode-cn.com/problems/binary-tree-level-order-traversal/
 
 */

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var result = [[Int]]()
        
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            
            let size = queue.count
            var level = [Int]()
            
            for _ in 0 ..< size {
                let node = queue.removeFirst()
                level.append(node.val)
                
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            result.append(level)
        }
        return result
    }
}
