//
//  Node.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/10/30.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa

public class Node: NSObject {
    public var val: Int
    public var children: [Node]?

    public init(_ val: Int, _ children: [Node]?) {
        self.val = val;
        self.children = children;
    }
};
