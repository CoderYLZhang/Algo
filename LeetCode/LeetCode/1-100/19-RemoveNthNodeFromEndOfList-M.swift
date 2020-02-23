//
//  19-RemoveNthNodeFromEndOfList.swift
//  LeetCode
//
//  Created by 张银龙 on 2020/2/23.
//  Copyright © 2020 张银龙. All rights reserved.
//

import Cocoa
/*
 19. 删除链表的倒数第N个节点
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。
 
 示例：
 
 给定一个链表: 1->2->3->4->5, 和 n = 2.
 
 当删除了倒数第二个节点后，链表变为 1->2->3->5.
 说明：
 
 给定的 n 保证是有效的。
 
 进阶：
 
 你能尝试使用一趟扫描实现吗？
 
 [中等] https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/
 */

class RemoveNthNodeFromEndOfList: NSObject {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if n <= 0 || head == nil {
            return head
        }
        
        let dummy = ListNode(0)
        dummy.next = head
        var slow: ListNode? = dummy
        var fast: ListNode? = dummy
        
        for _ in 0 ..< n {
            fast = fast?.next
        }
        
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        
        slow?.next = slow?.next?.next
        return dummy.next
    }
}
