//
//  236-LowestCommonAncestor.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/11/13.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

/*
 236. 二叉树的最近公共祖先
 
 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。
 
 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”
 
 例如，给定如下二叉树:  root = [3,5,1,6,2,0,8,null,null,7,4]
 
 
 
   
 
 示例 1:
 
 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 输出: 3
 解释: 节点 5 和节点 1 的最近公共祖先是节点 3。
 示例 2:
 
 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 输出: 5
 解释: 节点 5 和节点 4 的最近公共祖先是节点 5。因为根据定义最近公共祖先节点可以为节点本身。
   
 
 说明:
 
 所有节点的值都是唯一的。
 p、q 为不同节点且均存在于给定的二叉树中。
 
 链接：https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree
 
 */

class LowestCommonAncestor: NSObject {
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        if root.val == p?.val || root.val == q?.val  { return root }
        
        let left = lowestCommonAncestor(root.left, p, q)
        let right = lowestCommonAncestor(root.right, p, q)
        
        if left != nil, right != nil {
            return root
        }
        
        return (left != nil) ? left : right
    }
    
}
