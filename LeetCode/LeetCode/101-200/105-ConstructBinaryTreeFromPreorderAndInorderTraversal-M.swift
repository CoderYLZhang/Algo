//
//  105-ConstructBinaryTreeFromPreorderAndInorderTraversal.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/11/14.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

class ConstructBinaryTreeFromPreorderAndInorderTraversal: NSObject {
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count > 0, preorder.count == inorder.count else { return nil }
        
        
        self.preorder = preorder
        
        for (index, val) in inorder.enumerated() {
            inorderDict[val] = index
        }
        
        return buildTree(0, inorder.count - 1)
    }

    private func buildTree(_ start: Int, _ end: Int) -> TreeNode? {
        if start > end { return nil }
        
        let pivot = preorder[preIndex]
        let node = TreeNode(pivot);
        guard let index = inorderDict[pivot] else { return nil }
        preIndex += 1
        
        node.left = buildTree(start, index - 1)
        node.right = buildTree(index + 1, end)
        
        return node;
        
    }
    
    // 前序遍历的位置
    var preIndex = 0
    
    var inorderDict: [Int: Int] = [:]
    
    var preorder: [Int] = []
    
}
