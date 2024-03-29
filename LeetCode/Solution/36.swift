
//
//  36.swift
//  LeetCode
//
//  Created by persen on 2019/12/21.
//  Copyright © 2019 persen. All rights reserved.
//
//判断一个 9x9 的数独是否有效。只需要根据以下规则，验证已经填入的数字是否有效即可。
//
//数字 1-9 在每一行只能出现一次。
//数字 1-9 在每一列只能出现一次。
//数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
//
//
//上图是一个部分填充的有效的数独。
//
//数独部分空格内已填入了数字，空白格用 '.' 表示。
//
//示例 1:
//
//输入:
//[
//  ["5","3",".",".","7",".",".",".","."],
//  ["6",".",".","1","9","5",".",".","."],
//  [".","9","8",".",".",".",".","6","."],
//  ["8",".",".",".","6",".",".",".","3"],
//  ["4",".",".","8",".","3",".",".","1"],
//  ["7",".",".",".","2",".",".",".","6"],
//  [".","6",".",".",".",".","2","8","."],
//  [".",".",".","4","1","9",".",".","5"],
//  [".",".",".",".","8",".",".","7","9"]
//]
//输出: true
//示例 2:
//
//输入:
//[
//  ["8","3",".",".","7",".",".",".","."],
//  ["6",".",".","1","9","5",".",".","."],
//  [".","9","8",".",".",".",".","6","."],
//  ["8",".",".",".","6",".",".",".","3"],
//  ["4",".",".","8",".","3",".",".","1"],
//  ["7",".",".",".","2",".",".",".","6"],
//  [".","6",".",".",".",".","2","8","."],
//  [".",".",".","4","1","9",".",".","5"],
//  [".",".",".",".","8",".",".","7","9"]
//]
//输出: false
//解释: 除了第一行的第一个数字从 5 改为 8 以外，空格内其他数字均与 示例1 相同。
//     但由于位于左上角的 3x3 宫内有两个 8 存在, 因此这个数独是无效的。
//说明:
//
//一个有效的数独（部分已被填充）不一定是可解的。
//只需要根据以上规则，验证已经填入的数字是否有效即可。
//给定数独序列只包含数字 1-9 和字符 '.' 。
//给定数独永远是 9x9 形式的。
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/valid-sudoku
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
import Foundation
class Solution36 {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var childBoard = Array<Array<Character>>(repeating: Array<Character>(), count: 3)
        for (ri,row) in board.enumerated() {
            if isUnique(row) == false {
                return false
            }
            var colum = Array<Character>()
            for (ci,item) in row.enumerated() {
                colum.append(board[ci][ri])
                var array =  childBoard[ci/3]
                array.append(item)
                childBoard[ci/3] = array
                if array.count == 9 {
                    if isUnique(array) == false {
                       return false
                    }
                }
                
            }
            if ri % 3 == 2 {
                childBoard = Array<Array<Character>>(repeating: Array<Character>(), count: 3)
            }
            if isUnique(colum) == false  {
                return false
            }
        }
        return true
    }
    
    private func isUnique(_ array: [Character]) -> Bool {
        var counterArray = Array(repeating: 1, count: 10)
        for ch in array {
            if ch != "." {
                let index = Int(String(ch))!
                if index < counterArray.count {
                    let counter = counterArray[index] - 1
                    if counter < 0 {
                        return false
                    } else {
                        counterArray[index] = counter - 1
                    }
                }
                
            }
        }
        return true
    }
//    func isValidSudoku(_ board: [[Character]]) -> Bool {
//        var rowNums = Array(repeating: 0, count: 9)
//        var colNums = Array(repeating: 0, count: 9)
//        var boxNums = Array(repeating: 0, count: 9)
//        
//        for i in 0..<9 {
//            for j in 0..<9 {
//                if !board[i][j].isNumber {
//                    continue
//                }
//                let num = board[i][j].wholeNumberValue ?? 0
//                
//                if rowNums[i] & 1 << num != 0 {
//                    return false
//                } else {
//                    rowNums[i] |= 1 << num
//                }
//                
//                if colNums[j] & 1 << num != 0{
//                    return false
//                } else {
//                    colNums[j] |= 1 << num
//                }
//                
//                let boxIndex = i / 3 * 3 + j / 3
//                if boxNums[boxIndex] & 1 << num != 0 {
//                    return false
//                } else {
//                    boxNums[boxIndex] |= 1 << num
//                }
//            }
//        }
//        return true
//    }
}
