//
//  49-GroupAnagrams.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/10/27.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa
/*
 49. 字母异位词分组
 给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。

 示例:

 输入: ["eat", "tea", "tan", "ate", "nat", "bat"],
 输出:
 [
   ["ate","eat","tea"],
   ["nat","tan"],
   ["bat"]
 ]
 说明：

 所有输入均为小写字母。
 不考虑答案输出的顺序。

[中等] https://leetcode-cn.com/problems/group-anagrams
 
 */
class GroupAnagrams: NSObject {
    // 排序
    func groupAnagrams_sorted(_ strs: [String]) -> [[String]] {
        
        var map: [String: [String]] = [:]
        
        for str in strs {
            let sortedStr = String(str.sorted())
            if let arr = map[sortedStr] {
                map[sortedStr] = arr + [str]
            } else {
                map[sortedStr] = [str]
            }
        }
        
        return map.values.compactMap { $0 }
    }
    
}
