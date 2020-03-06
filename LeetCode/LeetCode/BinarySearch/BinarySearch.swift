//
//  BinarySearch.swift
//  LeetCode
//
//  Created by 张银龙 on 2020/3/6.
//  Copyright © 2020 张银龙. All rights reserved.
//

import Cocoa

// 二分查找
// 数组升序排列


// 最简单的情况
// 有序数组中不存在重复元素，在其中用二分查找值等于给定值的数据
class BinarySearch {

    func binarySearch(_ list: [Int], _ target: Int) -> Int? {
        
        var start = 0
        var end = list.count - 1
        
        while start <= end {
            
            let mid = start + (end - start) / 2
            
            if list[mid] == target {
                return mid
            } else if list[mid] < target {
                start = mid + 1
            } else {
                end = mid - 1
            }
            
        }
        
        return nil
    }
    
    // 变体一：查找第一个值等于给定值的元素
    
    func binarySearchFirstEqual(_ list: [Int], _ target: Int) -> Int? {
        
        var start = 0
        var end = list.count - 1
        
        while start <= end {
            
            let mid = start + (end - start) / 2
            
            if list[mid] == target {
                
                if mid == 0 || list[mid - 1] != target {
                    return mid
                } else {
                    end = mid - 1
                }
                
            } else if list[mid] < target {
                start = mid + 1
            } else {
                end = mid - 1
            }
            
        }
        
        return nil
    }
    
    // 变体二：查找最后一个值等于给定值的元素
    func binarySearchLastEqual(_ list: [Int], _ target: Int) -> Int? {
        
        var start = 0
        var end = list.count - 1
        
        while start <= end {
            
            let mid = start + (end - start) / 2
            
            if list[mid] == target {
                
                if mid == list.count - 1 || list[mid + 1] != target {
                    return mid
                } else {
                    start = mid + 1
                }
                
            } else if list[mid] < target {
                start = mid + 1
            } else {
                end = mid - 1
            }
            
        }
        
        return nil
    }
    
    // 变体三：查找第一个大于等于给定值的元素
    func binarySearchFirstGreaterEqual(_ list: [Int], _ target: Int) -> Int? {
        
        var start = 0
        var end = list.count - 1
        
        while start <= end {
            
            let mid = start + (end - start) / 2
            
            if list[mid] >= target {
                
                if mid == 0 || list[mid - 1] < target {
                    return mid
                } else {
                    end = mid - 1
                }
            
            } else {
                start = mid + 1
            }
            
        }
        
        return nil
    }
    
    // 变体四：查找最后一个小于等于给定值的元素
    func binarySearchLastLessEqual(_ list: [Int], _ target: Int) -> Int? {
        
        var start = 0
        var end = list.count - 1
        
        while start <= end {
            
            let mid = start + (end - start) / 2
            
            if list[mid] <= target {
                
                if mid == list.count - 1 || list[mid + 1] > target {
                    return mid
                } else {
                    start = mid + 1
                }
                
            } else {
                end = mid - 1
            }
            
        }
        
        return nil
    }
    
    
}
