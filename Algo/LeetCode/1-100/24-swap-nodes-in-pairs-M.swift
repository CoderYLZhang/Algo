//
//  swap-nodes-in-pairs-M.swift
//  LeetCode
//
//  Created by 张银龙 on 2020/3/1.
//  Copyright © 2020 张银龙. All rights reserved.
//

import Cocoa

/*
 24. 两两交换链表中的节点
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。

 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

 示例:

 给定 1->2->3->4, 你应该返回 2->1->4->3.
 
 [中等] https://leetcode-cn.com/problems/swap-nodes-in-pairs/
 */

class swap_nodes_in_pairs_M: NSObject {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        if head == nil || head?.next == nil {
            return head
        }
        
        var prev: ListNode? = ListNode(-1)
        var first = head
        var second = head?.next
        let next = second
       
        /*
         prev  first  second  next
                 1  ->  2  ->  3  ->  4 -> null
                       .
                       .
         进行如下指针变换:
         prev -> second -> first -> next
                   2    ->   1   ->  3  ->  4 -> null
                       .
                       .
         移动指针:
                            prev   first  second  next
                   2    ->   1   ->  3  ->  4 -> null
                       .
                       .
         重复上述操作

         作者：MuYunyun
         链接：https://leetcode-cn.com/problems/swap-nodes-in-pairs/solution/si-zhi-zhen-by-muyunyun
         */
        
        while second != nil {
            // 指针变换
            prev?.next = second
            first?.next = second?.next
            second?.next = first
            // 移动指针
            prev = first
            
            first = first?.next
            second = first?.next
        }
        return next
    }
    
    func swapPairs2(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let newHead = head?.next
        head?.next = swapPairs(newHead?.next)
        newHead?.next = head
        return newHead
    }
}
