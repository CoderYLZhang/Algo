//
//  641-DesignCircularDeque.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/10/25.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa
/*
 设计实现双端队列。
 你的实现需要支持以下操作：

 MyCircularDeque(k)：构造函数,双端队列的大小为k。
 insertFront()：将一个元素添加到双端队列头部。 如果操作成功返回 true。
 insertLast()：将一个元素添加到双端队列尾部。如果操作成功返回 true。
 deleteFront()：从双端队列头部删除一个元素。 如果操作成功返回 true。
 deleteLast()：从双端队列尾部删除一个元素。如果操作成功返回 true。
 getFront()：从双端队列头部获得一个元素。如果双端队列为空，返回 -1。
 getRear()：获得双端队列的最后一个元素。 如果双端队列为空，返回 -1。
 isEmpty()：检查双端队列是否为空。
 isFull()：检查双端队列是否满了。
 示例：

 MyCircularDeque circularDeque = new MycircularDeque(3); // 设置容量大小为3
 circularDeque.insertLast(1);                    // 返回 true
 circularDeque.insertLast(2);                    // 返回 true
 circularDeque.insertFront(3);                    // 返回 true
 circularDeque.insertFront(4);                    // 已经满了，返回 false
 circularDeque.getRear();                  // 返回 2
 circularDeque.isFull();                        // 返回 true
 circularDeque.deleteLast();                    // 返回 true
 circularDeque.insertFront(4);                    // 返回 true
 circularDeque.getFront();                // 返回 4
  
  

 提示：

 所有值的范围为 [1, 1000]
 操作次数的范围为 [1, 1000]
 请不要使用内置的双端队列库。

 [困难] https://leetcode-cn.com/problems/design-circular-deque
 */
// TODO
#if false
class MyCircularDeque {

    /** Initialize your data structure here. Set the size of the deque to be k. */
    init(_ k: Int) {
        
    }
    
    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    func insertFront(_ value: Int) -> Bool {
        
    }
    
    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    func insertLast(_ value: Int) -> Bool {
        
    }
    
    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    func deleteFront() -> Bool {
        
    }
    
    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    func deleteLast() -> Bool {
        
    }
    
    /** Get the front item from the deque. */
    func getFront() -> Int {
        
    }
    
    /** Get the last item from the deque. */
    func getRear() -> Int {
        
    }
    
    /** Checks whether the circular deque is empty or not. */
    func isEmpty() -> Bool {
        
    }
    
    /** Checks whether the circular deque is full or not. */
    func isFull() -> Bool {
        
    }
}
#endif
/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * let obj = MyCircularDeque(k)
 * let ret_1: Bool = obj.insertFront(value)
 * let ret_2: Bool = obj.insertLast(value)
 * let ret_3: Bool = obj.deleteFront()
 * let ret_4: Bool = obj.deleteLast()
 * let ret_5: Int = obj.getFront()
 * let ret_6: Int = obj.getRear()
 * let ret_7: Bool = obj.isEmpty()
 * let ret_8: Bool = obj.isFull()
 */
