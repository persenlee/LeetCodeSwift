//
//  22.swift
//  LeetCode
//
//  Created by persen on 2019/9/16.
//  Copyright © 2019 persen. All rights reserved.
//
//给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。
//
//例如，给出 n = 3，生成结果为：
//
//[
//"((()))",
//"(()())",
//"(())()",
//"()(())",
//"()()()"
//]
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/generate-parentheses
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
import Foundation

// 回溯法
// n = 1 ()
// n =2 ()() (())
// n= 3 ()()() (())() ()(()) ((())) ()(())
// 基于n-1 插入
class Solution22 {
    func generateParenthesis(_ n: Int) -> [String] {
        if n == 0 {
            return []
        }
        if n == 1 {
            return ["()"]
        }
        let array = generateParenthesis(n - 1)
        var result = Set<String>()
        for str in array {
            var j = 0;
            while j < str.count {
                var str = str
                let idx = str.index(str.startIndex, offsetBy: j)
                str.insert(contentsOf: "()", at: idx)
                result.insert(str)
                j+=1
            }
        }
        return Array<String>(result)
    }
}
