//
//  linked-list-cycle-ii.swift
//  LeetCode
//
//  Created by 张银龙 on 2020/3/1.
//  Copyright © 2020 张银龙. All rights reserved.
//

import Cocoa
/*
 142. 环形链表 II
 给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。

 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。

 说明：不允许修改给定的链表。

 示例 1：

 输入：head = [3,2,0,-4], pos = 1
 输出：tail connects to node index 1
 解释：链表中有一个环，其尾部连接到第二个节点。

 示例 2：

 输入：head = [1,2], pos = 0
 输出：tail connects to node index 0
 解释：链表中有一个环，其尾部连接到第一个节点。


 示例 3：

 输入：head = [1], pos = -1
 输出：no cycle
 解释：链表中没有环。
 进阶：
 你是否可以不用额外空间解决此题？
 
 [中等] https://leetcode-cn.com/problems/linked-list-cycle-ii/
 // 题解
 // https://leetcode-cn.com/problems/linked-list-cycle-ii/solution/linked-list-cycle-ii-kuai-man-zhi-zhen-shuang-zhi-/
 */

class linked_list_cycle_ii: NSObject {
    func detectCycle(_ head: ListNode?, _ pos: Int) -> ListNode? {
        
        if head == nil {
            return head
        }
        
        var fast = head
        var slow = head
        
        while fast != nil, fast?.next != nil {
            
            fast = fast?.next?.next
            slow = slow?.next
            
            // 快遇上慢, 说明有环
            if fast === slow {
                
                var entry = head
                
                while entry !== slow {
                    entry = entry?.next
                    slow = slow?.next
                }
                
                return entry
            }
        }
        
        return nil
        
    }
}
