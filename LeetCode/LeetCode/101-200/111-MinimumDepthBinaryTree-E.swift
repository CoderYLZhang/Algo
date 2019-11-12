//
//  111-MinimumDepthBinaryTree.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/11/12.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

/*
 111. 二叉树的最小深度
 给定一个二叉树，找出其最小深度。

 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。

 说明: 叶子节点是指没有子节点的节点。

 示例:

 给定二叉树 [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回它的最小深度  2.

 链接：https://leetcode-cn.com/problems/minimum-depth-of-binary-tree
 */

class MinimumDepthBinaryTree: NSObject {
    
    // 48 ms
    func minDepth(_ root: TreeNode?) -> Int {
        if (root == nil) { return 0 }
        
        if root?.left == nil, root?.right == nil { return 1 }
        
        var depth = Int.max
        
        if root?.left != nil {
            depth = min(minDepth(root?.left), depth)
        }
        
        if root?.right != nil {
            depth = min(minDepth(root?.right), depth)
        }
        
        return depth + 1
    }
    
    // 48 ms
    func minDepth_2(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        
        if root?.left == nil {
            return minDepth(root?.right) + 1
        }
        if root?.right == nil {
            return minDepth(root?.left) + 1
        }
        return min(minDepth(root?.left), minDepth(root?.right)) + 1
    }
    
}
