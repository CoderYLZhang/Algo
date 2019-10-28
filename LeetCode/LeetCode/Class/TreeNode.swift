//
//  TreeNode.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/10/28.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
 }
