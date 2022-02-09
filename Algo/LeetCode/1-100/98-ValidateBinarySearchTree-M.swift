//
//  98-ValidateBinarySearchTree.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/11/11.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

/*
 给定一个二叉树，判断其是否是一个有效的二叉搜索树。

 假设一个二叉搜索树具有如下特征：

 节点的左子树只包含小于当前节点的数。
 节点的右子树只包含大于当前节点的数。
 所有左子树和右子树自身必须也是二叉搜索树。
 示例 1:

 输入:
     2
    / \
   1   3
 输出: true
 示例 2:

 输入:
     5
    / \
   1   4
      / \
     3   6
 输出: false
 解释: 输入为: [5,1,4,null,null,3,6]。
      根节点的值为 5 ，但是其右子节点值为 4 。

 链接：https://leetcode-cn.com/problems/validate-binary-search-tree
 */

class ValidateBinarySearchTree: NSObject {
    // 递归
    func isValidBST(_ root: TreeNode?) -> Bool {
        
        func isValidBST(_ root: TreeNode?, lower: Int?, upper: Int?) -> Bool {
            guard let root = root else { return true }
            
            // 左子树有值的情况
            if let lower = lower, root.val <= lower { return false }
            // 右子树有值的情况
            if let upper = upper, root.val >= upper { return false }
            
            // 递归对比 左子树
            if !isValidBST(root.left, lower: lower, upper: root.val) { return false }
            // 递归对比 右子树
            if !isValidBST(root.right, lower: root.val, upper: upper) { return false }
            
            return true
        }
        
        return isValidBST(root, lower: nil, upper: nil)
    }
}
