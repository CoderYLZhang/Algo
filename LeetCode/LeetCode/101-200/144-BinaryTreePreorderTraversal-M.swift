//
//  144-BinaryTreePreorderTraversal.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/10/28.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa
/*
 144. 二叉树的前序遍历
 
 给定一个二叉树，返回它的 前序 遍历。

  示例:

 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [1,2,3]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？

 [中等] https://leetcode-cn.com/problems/binary-tree-preorder-traversal
 */
class BinaryTreePreorderTraversal: NSObject {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        
        func traversal(_ root: TreeNode?) {
            guard let root = root else { return }
            
            result.append(root.val)
            traversal(root.left)
            traversal(root.right)
            
        }
        
        traversal(root)
        
        return result
    }
}
