//
//  main.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/10/20.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Foundation


let node5 = Node(5, nil)
let node6 = Node(6, nil)

let node3 = Node(3, [node5, node6])
let node2 = Node(2, nil)
let node4 = Node(4, nil)

let node1 = Node(1, [node3, node2, node4])

print(NTreePostorderTraversal().postorder(node1))
