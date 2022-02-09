//
//  104-MaximumDepthBinaryTree-E.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/11/12.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

/*
 104. 二叉树的最大深度
 给定一个二叉树，找出其最大深度。

 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

 说明: 叶子节点是指没有子节点的节点。

 示例：
 给定二叉树 [3,9,20,null,null,15,7]，

     3
    / \
   9  20
     /  \
    15   7
 返回它的最大深度 3 。

 链接：https://leetcode-cn.com/problems/maximum-depth-of-binary-tree
 */

class MaximumDepthBinaryTree: NSObject {
    
    // 40 ms
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let leftCount = maxDepth(root.left)
        let rightCount = maxDepth(root.right)
        
        return max(leftCount, rightCount) + 1
    }
    
    // 36 ms
    func maxDepth_2(_ root: TreeNode?) -> Int {
        if (root == nil) { return 0 }
        
        return max(maxDepth(root?.left) + 1, maxDepth(root?.right) + 1)
    }
}
