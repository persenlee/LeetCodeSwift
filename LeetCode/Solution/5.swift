//
//  LongestPalindrome.swift
//  LeetCode
//
//  Created by persen on 2019/8/21.
//  Copyright © 2019 persen. All rights reserved.
//

//给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。
//
//示例 1：
//
//输入: "babad"
//输出: "bab"
//注意: "aba" 也是一个有效答案。
//示例 2：
//
//输入: "cbbd"
//输出: "bb"
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/longest-palindromic-substring
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

import Foundation
class LongestPalindrome {
    //最大公共子串
    //    func longestPalindrome(_ s: String) -> String {
    //        if s.count < 2 {
    //            return s
    //        }
    //        var longestStr = String(s.first!)
    //        let sr = String(s.reversed())
    //        var l = 0,r = 1
    //        while l < s.count && r < s.count {
    //            let lIndex = s.index(s.startIndex, offsetBy: l)
    //            let rIndex = s.index(s.startIndex, offsetBy: r)
    //            let subStr = String(s[lIndex...rIndex])
    //            if subStr.count > longestStr.count {
    //                if let range = sr.range(of: subStr) {
    //                    let rri = sr.distance(from: range.lowerBound, to: sr.endIndex) - 1
    //                    let lri = sr.distance(from: range.upperBound, to: sr.endIndex)
    //                    if lri == l &&  rri == r {
    //                        longestStr = subStr
    //                    }
    //                }
    //            }
    //            r = r + 1
    //            if r == s.count {
    //                l = l + 1
    //                r = l + 1
    //            }
    //        }
    //        return longestStr
    //    }
    //穷举法
    //    func longestPalindrome(_ s: String) -> String {
    //        if s.count < 2 {
    //            return s
    //        }
    //        var longestStr = String(s.first!)
    //        var l = 0,r = 1
    //        while l < s.count && r < s.count {
    //            let lIndex = s.index(s.startIndex, offsetBy: l)
    //            let rIndex = s.index(s.startIndex, offsetBy: r)
    //            let subStr = String(s[lIndex...rIndex])
    //            if subStr.count > longestStr.count {
    //                let subStrReverse = String(subStr.reversed())
    //                    if subStr == subStrReverse {
    //                        longestStr = subStr
    //                    }
    //            }
    //            r = r + 1
    //            if r >= s.count {
    //                l = l + 1
    //                r = l + longestStr.count
    //            }
    //        }
    //        return longestStr
    //    }
    //动态规划
    //    func longestPalindrome(_ s: String) -> String {
    //        if s.count < 2 {
    //            return s
    //        }
    //        var longestStr = String(s.first!)
    //        var l = 0,r = 0
    //        var matrix = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: s.count), count: s.count)
    //        for len in 1...s.count {
    //            for i in 0..<s.count {
    //                l = i
    //                r = i + len - 1
    //                if r >= s.count  {
    //                    continue
    //                }
    //                let lIndex = s.index(s.startIndex, offsetBy: l)
    //                let rIndex = s.index(s.startIndex, offsetBy: r)
    //                let isRev = (len == 1) || (len == 2 && s[lIndex] == s[rIndex]) || (matrix[l+1][r - 1] && s[lIndex] == s[rIndex])
    //                matrix[l][r] = isRev
    //                if isRev {
    //                    let subStr = String(s[lIndex...rIndex])
    //                    if subStr.count > longestStr.count {
    //                        longestStr = subStr
    //                    }
    //                }
    //            }
    //        }
    //        return longestStr
    //    }
    //中间扩展
    func longestPalindrome(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
        var longestStr = String(s.first!)
        var l = 0,r = 0
        for i in 0..<s.count {
            let len1 = searchAroundCenter(s, i, i)
            let len2 = searchAroundCenter(s, i, i+1)
            let len = max(len1, len2)
            if len > (r - l + 1) {
                l = i - (len - 1) / 2
                r = i + len / 2
            }
        }
        let lIndex = s.index(s.startIndex, offsetBy: l)
        let rIndex = s.index(s.startIndex, offsetBy: r)
        longestStr = String(s[lIndex...rIndex])
        return longestStr
    }
    
    private func searchAroundCenter(_ s: String,_ l: Int,_ r: Int) -> Int{
        var left = l,right = r
        while left >= 0 && right < s.count {
            let lIndex = s.index(s.startIndex, offsetBy: left)
            let rIndex = s.index(s.startIndex, offsetBy: right)
            if s[lIndex] != s[rIndex] {
                break
            }
            left-=1
            right+=1
        }
        return right - left - 1
    }
}
