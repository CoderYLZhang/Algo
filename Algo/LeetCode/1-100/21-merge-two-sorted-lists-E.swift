//
//  merge-two-sorted-lists.swift
//  LeetCode
//
//  Created by 张银龙 on 2020/2/24.
//  Copyright © 2020 张银龙. All rights reserved.
//

import Cocoa

/*
 21. 合并两个有序链表
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

 示例：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 
  [简单] https://leetcode-cn.com/problems/merge-two-sorted-lists/
 */

class MergeTwoSortedLists: NSObject {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let list1 = l1, let list2 = l2 else {
            return l1 ?? l2
        }
        
        if list1.val < list2.val {
            list1.next = mergeTwoLists(list1.next, list2)
            return list1
        } else {
            list2.next = mergeTwoLists(list1, list2.next)
            return list2
        }
        
    }
}
