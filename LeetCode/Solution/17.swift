//
//  17.swift
//  LeetCode
//
//  Created by persen on 2019/9/10.
//  Copyright © 2019 persen. All rights reserved.
//

//给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。
//
//给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
//
//https://assets.leetcode-cn.com/aliyun-lc-upload/original_images/17_telephone_keypad.png
//
//示例:
//
//输入："23"
//输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
//说明:
//尽管上面的答案是按字典序排列的，但是你可以任意选择答案输出的顺序。
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

import Foundation

class Solution17 {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return []
        }
        let dic = [
            "2" : ["a","b","c"],
            "3" : ["d","e","f"],
            "4" : ["g","h","i"],
            "5" : ["j","k","l"],
            "6" : ["m","n","o"],
            "7" : ["p","q","r","s"],
            "8" : ["t","u","v"],
            "9" : ["w","x","y","z"],
        ]
        
        var values = Array<Array<String>>()
        
        for digit in digits {
            values.append(dic[String(digit)]!)
        }
        
        var i = 1
        var array = values[0]
        while i < values.count {
            array = combine(array, values[i])
            i += 1
        }
        
        return array
    }
    
   private func combine(_ d1: [String], _ d2: [String]) -> [String] {
        var results = Array<String>()
        for s1 in d1 {
            for s2 in d2 {
                results.append(s1 + s2)
            }
        }
        return results
    }
}
