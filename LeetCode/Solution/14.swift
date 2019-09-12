//
//  14.swift
//  LeetCode
//
//  Created by persen on 2019/9/5.
//  Copyright © 2019 persen. All rights reserved.
//

//编写一个函数来查找字符串数组中的最长公共前缀。
//
//如果不存在公共前缀，返回空字符串 ""。
//
//示例 1:
//
//输入: ["flower","flow","flight"]
//输出: "fl"
//示例 2:
//
//输入: ["dog","racecar","car"]
//输出: ""
//解释: 输入不存在公共前缀。
//说明:
//
//所有输入只包含小写字母 a-z 。
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/longest-common-prefix
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

import Foundation

class Solution14 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        if strs.count == 1 {
            return strs.first!
        }
        var result = ""
        var i = 0
        let firstStr = strs.first!
        while i < firstStr.count {
            let ch = firstStr[firstStr.index(firstStr.startIndex, offsetBy: i)]
            for str in strs {
                if i >= str.count {
                    return result
                }
                let ch1 = str[str.index(str.startIndex, offsetBy: i)]
                if ch != ch1 {
                    return result
                }
            }
            result = String(firstStr[firstStr.startIndex...firstStr.index(firstStr.startIndex, offsetBy: i)])
            i += 1
        }
        return result
    }
}
