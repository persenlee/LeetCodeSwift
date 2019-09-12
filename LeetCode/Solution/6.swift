//
//  StringZTransform.swift
//  LeetCode
//
//  Created by persen on 2019/8/21.
//  Copyright © 2019 persen. All rights reserved.
//

import Foundation
//将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。
//之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"。

//例子1
//输入: s = "LEETCODEISHIRING", numRows = 3
//输出: "LCIRETOESIIGEDHN"
//解释:
//L   C   I   R
//E T O E S I I G
//E   D   H   N

//例子2
//输入: s = "LEETCODEISHIRING", numRows = 4
//输出: "LDREOEIIECIHNTSG"
//解释:
//L     D     R
//E   O E   I I
//E C   I H   N
//T     S     G

//a + b = column
//a * row +  b = s.count
//a (row -2) = b
//a (row -2) + a = column
//a * row + a (row -2) = s.count
//a = column/(row -1)
// a = s.count/2(row -1)
// column = s.count /2

class  Solution6{
    //二维s数组法
//    func convert(_ s: String, _ numRows: Int) -> String {
//        if s.count <= numRows || numRows < 2{
//            return s
//        }
//        let column = (s.count + 1) / 2
//        var matrix = Array<Array<String>>(repeating: Array<String>(repeating: "", count: column), count: numRows)
//        var r = 0,c = 0
//        var reverse = false
//        for (_,ch) in s.enumerated() {
//            matrix[r][c] = String(ch)
//            let prevR = r
//            if reverse {
//                if r - 1 < 0 {
//                    reverse = false
//                    r = r + 1
//                } else {
//                    r = r - 1
//                }
//            } else {
//                if  r + 1 >= numRows {
//                    reverse = true
//                    r = r - 1
//                } else {
//                    r = r + 1
//                }
//
//            }
//            c = prevR > r ? (c + 1) : c
//
//        }
//        var resultStr = ""
//        for i in 0..<numRows {
//            for j in 0..<column {
//                let str = matrix[i][j]
//                if str.count > 0 {
//                    resultStr = resultStr + str
//                }
//            }
//        }
//        return resultStr
//    }
    
    //按行排序
    func convert(_ s: String, _ numRows: Int) -> String {
        if s.count <= numRows || numRows < 2{
            return s
        }
        let len = min(s.count, numRows)
        var rows = Array<String>(repeating: "", count: len)
        var reverse = true
        var row = 0
        for (_,ch) in s.enumerated() {
            rows[row] = rows[row] + String(ch)
            if row == 0 || row == numRows - 1 {
                reverse = !reverse
            }
            row = reverse ? row - 1 : row + 1
        }
        var resultStr = ""
        for str in rows {
            resultStr += str
        }
        return resultStr
    }
    
    //按行读取
}
