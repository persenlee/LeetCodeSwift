//
//  29.swift
//  LeetCode
//
//  Created by persen on 2019/9/17.
//  Copyright © 2019 persen. All rights reserved.
//
//给定两个整数，被除数 dividend 和除数 divisor。将两数相除，要求不使用乘法、除法和 mod 运算符。
//
//返回被除数 dividend 除以除数 divisor 得到的商。
//
//示例 1:
//
//输入: dividend = 10, divisor = 3
//输出: 3
//示例 2:
//
//输入: dividend = 7, divisor = -3
//输出: -2
//说明:
//
//被除数和除数均为 32 位有符号整数。
//除数不为 0。
//假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−231,  231 − 1]。本题中，如果除法结果溢出，则返回 231 − 1。
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/divide-two-integers
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
import Foundation

class Solution29 {
    // 换算成减法
//    func divide(_ dividend: Int, _ divisor: Int) -> Int {
//        if dividend == 0 {
//            return 0
//        }
//
//        if divisor == 1  {
//            return dividend
//        }
//        if divisor == -1 {
//            if dividend == Int32.min {
//                return Int(Int32.max)
//            }
//            return dividend * divisor
//        }
//        let dividendFlag = dividend > 0 ? 1 : -1
//        let divisorFlag = divisor > 0 ? 1 : -1
//        let flag = dividendFlag * divisorFlag
//        var left = dividend
//        var result = 0
//        while true {
//            if flag > 0 {
//                left -= divisor
//            } else {
//                left += divisor
//            }
//            if dividend > 0 && left < 0 {
//                break
//            }
//            if dividend < 0 && left > 0 {
//                break
//            }
//            result += 1
//        }
//        result *= flag
//        return result
//    }
    // 优化除数倍增
//     func divide(_ dividend: Int, _ divisor: Int) -> Int {
//        if (dividend == Int32.min && divisor == -1) {
//            return Int(Int32.max)
//        }
//
//        var flag = 1,dividend = dividend,divisor = divisor // 1 表示正数，-1表示负数；
//        if (dividend > 0) {
//            dividend = -dividend
//        } else {
//            flag = -flag
//        }
//        if (divisor > 0) {
//            divisor = -divisor
//        } else {
//            flag = -flag
//        }
//
//        var s = 0
//        var tmpd = 0, k = 0
//        while (dividend <= divisor) {
//            tmpd = divisor
//            k = 1
//            while (dividend <= tmpd + tmpd && tmpd + tmpd < 0) {
//                tmpd += tmpd
//                k += k
//            }
//            s = s + k
//            dividend -= tmpd
//        }
//        return flag > 0 ? s : -s;
//     }
    
    //位运算
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend == 0 {
            return 0
        }

        if divisor == 1  {
            return dividend
        }
        
        if divisor == -1 {
            if dividend == Int32.min {
                return Int(Int32.max)
            }
            return -dividend
        }
        var sign = 1
        if(dividend < 0) {
            sign = -sign
        }
        if(divisor < 0 ) {
            sign = -sign
        }
        
        var result = 0
        var dividend = abs(dividend)
        let divisor = abs(divisor)
        var i = 32
        while i >= 0 {
            if (dividend >> i) >= divisor {
                result += 1 << i;
                dividend -= divisor << i
            }
            i -= 1
        }
        return sign > 0 ? result : -result
    }
}
