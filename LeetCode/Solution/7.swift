//
//  ReverseInt32.swift
//  LeetCode
//
//  Created by persen on 2019/8/21.
//  Copyright © 2019 persen. All rights reserved.
//

//给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
//
//示例 1:
//
//输入: 123
//输出: 321
// 示例 2:
//
//输入: -123
//输出: -321
//示例 3:
//
//输入: 120
//输出: 21
//注意:
//
//假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
//
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/reverse-integer
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

import Foundation
class Solution7 {
//    func reverse(_ x: Int) -> Int {
//        if x < 10 && x > -10 {
//            return x
//        }
//        if x <= Int32.min  || x > Int32.max {
//            return 0
//        }
//
//        var s = String(String(x).reversed())
//        var minus = 1
//        if x < 0 {
//            minus = -1
//            s.removeLast()
//        }
//        let r = Int(s)! * minus
//        if r < Int32.min  || r > Int32.max {
//            return 0
//        }
//        return r
//    }
    func reverse(_ x: Int) -> Int {
        var t = x
        var r = 0
        while t != 0 {
            r = r * 10 + (t % 10) 
            t = t / 10
        }
        if r < Int32.min  || r > Int32.max {
            return 0
        }
        return r
    }
}
