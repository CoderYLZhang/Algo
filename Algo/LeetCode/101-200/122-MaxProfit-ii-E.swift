//
//  122-MaxProfit-E.swift
//  LeetCode
//
//  Created by yinlong on 2021/7/9.
//  Copyright © 2021 张银龙. All rights reserved.
//

import Foundation


class MaxProfit_II {
    // 贪心
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        var ans: Int = 0
        
        for index in 1 ..< prices.count {
            // 卖出有利可图
            if prices[index] > prices[index - 1] {
                ans += prices[index] - prices[index - 1]
            }
        }
        
        return ans
    }
    
    // 动态规划
    func maxProfit2(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        // cash：持有现金
        // hold：持有股票
        // 状态转移：cash → hold → cash → hold → cash → hold → cash
        
        var cash: Int = 0
        var hold: Int = -prices[0]

        var preCash = cash
        var preHold = hold
        
        for index in 1 ..< prices.count {
            // 卖出股票
            cash = max(preCash, preHold + prices[index])
            // 买入股票
            hold = max(preHold, preCash - prices[index])
            
            preCash = cash
            preHold = hold
        }
        
        return cash
    }
}
