//
//  30.swift
//  LeetCode
//
//  Created by persen on 2019/9/18.
//  Copyright © 2019 persen. All rights reserved.
//

//给定一个字符串 s 和一些长度相同的单词 words。找出 s 中恰好可以由 words 中所有单词串联形成的子串的起始位置。
//
//注意子串要与 words 中的单词完全匹配，中间不能有其他字符，但不需要考虑 words 中单词串联的顺序。
//
//
//
//示例 1：
//
//输入：
//s = "barfoothefoobarman",
//words = ["foo","bar"]
//输出：[0,9]
//解释：
//从索引 0 和 9 开始的子串分别是 "barfoor" 和 "foobar" 。
//输出的顺序不重要, [9,0] 也是有效答案。
//示例 2：
//
//输入：
//s = "wordgoodgoodgoodbestword",
//words = ["word","good","best","word"]
//输出：[]
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/substring-with-concatenation-of-all-words
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
import Foundation

class Solution30 {
//    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
//        if s.count == 0 || words.count == 0 {
//            return []
//        }
//        var result = Array<Int>()
//        let signleCount =  words.first!.count
//        let composeLength = signleCount * words.count
//
//        if s.count >= composeLength {
//            var i = 0
//            while i <= s.count - composeLength {
//                let subStr = s[s.index(s.startIndex, offsetBy: i)..<s.index(s.startIndex, offsetBy: i + composeLength)]
//                var j = 0
//                var words = words
//                while j <= subStr.count - signleCount {
//                    let str = subStr[subStr.index(subStr.startIndex, offsetBy: j)..<subStr.index(subStr.startIndex, offsetBy: j + signleCount)]
//                    if let index = words.firstIndex(of: String(str)) {
//                        words.remove(at: index)
//                    } else {
//                        break
//                    }
//                    j+=signleCount
//                }
//                if words.count == 0 {
//                    result.append(i)
//                }
//                i += 1
//            }
//        }
//        return result
//    }
    
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        if s.count == 0 || words.count == 0 {
            return []
        }
        var result = Array<Int>()
        let signleCount =  words.first!.count
        let composeLength = signleCount * words.count
        
        var map = Dictionary<String,Int>()
        for word in words {
            if let count = map[word] {
                map[word] = count + 1
            } else {
                map[word] = 1
            }
        }
        let wordsMap = map
        
        if s.count >= composeLength {
            var i = 0
            while i <= s.count - composeLength {
                let subStr = s[s.index(s.startIndex, offsetBy: i)..<s.index(s.startIndex, offsetBy: i + composeLength)]
                var j = 0
                var map = wordsMap
                while j <= subStr.count - signleCount {
                    let str = subStr[subStr.index(subStr.startIndex, offsetBy: j)..<subStr.index(subStr.startIndex, offsetBy: j + signleCount)]
                    if let count = map[String(str)] {
                        let newCount = count - 1
                        if newCount == 0 {
                            map.removeValue(forKey: String(str))
                        } else {
                            map[String(str)] = newCount
                        }
                    } else {
                        break
                    }
                    j+=signleCount
                }
                if map.keys.count == 0 {
                    result.append(i)
                }
                i += 1
            }
        }
        return result
    }
}
