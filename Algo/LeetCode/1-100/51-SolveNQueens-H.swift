//
//  51-SolveNQueens-H.swift
//  LeetCode
//
//  Created by yinlong on 2021/7/12.
//  Copyright © 2021 张银龙. All rights reserved.
//

import Foundation

/*
 51. N 皇后
 n 皇后问题 研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。

 给你一个整数 n ，返回所有不同的 n 皇后问题 的解决方案。

 每一种解法包含一个不同的 n 皇后问题 的棋子放置方案，该方案中 'Q' 和 '.' 分别代表了皇后和空位。

  

 示例 1：


 输入：n = 4
 输出：[[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
 解释：如上图所示，4 皇后问题存在两个不同的解法。
 示例 2：

 输入：n = 1
 输出：[["Q"]]
  

 提示：

 1 <= n <= 9
 皇后彼此不能相互攻击，也就是说：任何两个皇后都不能处于同一条横行、纵行或斜线上。
 https://leetcode-cn.com/problems/n-queens/
 */

class SolveNQueens {
    func solveNQueens(_ n: Int) -> [[String]] {
        if n == 1 { return [["Q"]] }
        if n == 2 { return [[String]]() }
        if n == 3 { return [[String]]() }
        
        func dfs(_ n: Int, _ subSet: inout [Int], _ result: inout [[Int]]) {
            guard subSet.count < n else {
                // 表示每一行都放完了
                result.append(subSet)
                return
            }
            // 每一行Queen的位置都有n-1种放法，可以从0选到n-1
            for i in 0 ..< n {
                guard isValid(subSet, i) else { continue }
                //第row行的棋子放到了column列
                subSet.append(i)
                dfs(n, &subSet, &result)//考察下一行
                //回溯还原这个位置 全局入参需求清理状态归位
                subSet.removeLast()//能走到这里说明之前放的不对 当前行需要从新放 回溯
            }
        }
        
        func isValid(_ subSet: [Int], _ index: Int) -> Bool {
            let currentRow = subSet.count
            
            for row in 0..<subSet.count {
                if subSet[row] == index {
                    return false
                }
                if row + subSet[row] == currentRow + index {
                    return false
                }
                if row - subSet[row] == currentRow - index {
                    return false
                }
            }
            return true
        }
        
        
        func getResult(_ result: [[Int]]) -> [[String]] {
            return result.map {
                return $0.map { index in
                    var s = Array<Character>(repeating: ".", count: n)
                    s[index] = "Q"
                    return String(s)
                }
            }
        }
        
        var result = [[Int]]()
        var subSet = [Int]()
        
        dfs(n, &subSet, &result)
        
        return getResult(result)
    }
}
