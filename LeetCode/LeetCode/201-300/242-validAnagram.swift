//
//  242-validAnagram.swift
//  LeetCode
//
//  Created by 张银龙 on 2019/10/26.
//  Copyright © 2019 张银龙. All rights reserved.
//

import Cocoa
/*
242. 有效的字母异位词
给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。

示例 1:

输入: s = "anagram", t = "nagaram"
输出: true
示例 2:

输入: s = "rat", t = "car"
输出: false
说明:
你可以假设字符串只包含小写字母。

进阶:
如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？

[简单] https://leetcode-cn.com/problems/valid-anagram

*/

class ValidAnagram: NSObject {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        // 计算"a" 的 ASCII 码
        let offset = Int("a".unicodeScalars.first?.value ?? 0)
        
        var keys: [Int] = Array(repeating: 0, count: 26)
        
        for utf8 in s.utf8 {
            keys[Int(utf8) - offset] += 1
        }
        
        for utf8 in t.utf8 {
            keys[Int(utf8) - offset] -= 1
            if keys[Int(utf8) - offset] < 0 {
                return false
            }
        }
        
        return keys == Array(repeating: 0, count: 26)
    }
}
