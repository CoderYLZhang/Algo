//
//  226-InvertBinaryTree.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/11/10.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa
/*
 翻转一棵二叉树。

 示例：

 输入：

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 输出：

      4
    /   \
   7     2
  / \   / \
 9   6 3   1

 链接：https://leetcode-cn.com/problems/invert-binary-tree
 */
class InvertBinaryTree: NSObject {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        let right = invertTree(root.right)
        let left = invertTree(root.left)
        
        root.left = right
        root.right = left
        
        return root
    }
}
