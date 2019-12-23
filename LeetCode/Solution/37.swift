//
//  37.swift
//  LeetCode
//
//  Created by persen on 2019/12/22.
//  Copyright © 2019 persen. All rights reserved.
//
//编写一个程序，通过已填充的空格来解决数独问题。
//
//一个数独的解法需遵循如下规则：
//
//数字 1-9 在每一行只能出现一次。
//数字 1-9 在每一列只能出现一次。
//数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
//空白格用 '.' 表示。
//Note:
//
//给定的数独序列只包含数字 1-9 和字符 '.' 。
//你可以假设给定的数独只有唯一解。
//给定数独永远是 9x9 形式的。
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/sudoku-solver
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
import Foundation
class Solution37 {
    var rowCounters = Array(repeating: 0, count: 9)
    var columnCounters = Array(repeating: 0, count: 9)
    var boxCounters = Array(repeating: 0, count: 9)
    var board: [[Character]] = Array<Array<Character>>()
    var unPlaceBoard: [[Int]] = Array<Array<Int>>()
    
    func solveSudoku(_ board: inout [[Character]]) {
        fillCounters(board)
        self.board = board
        
        var index = 0
        while index < self.unPlaceBoard.count {
            let item = self.unPlaceBoard[index]
            let i = item.first!,j = item.last!
            if(solve(i, j)) {
                index = index + 1
            } else {
                //寻找回溯点
                let back = backtrack(index)
                if( back != -1) {
                    //继续
                    index = back + 1
                } else {
                    //无解
                    break;
                }
            }
        }
        board = self.board
    }
    
    private func backtrack(_ index: Int) -> Int {
        if index > 0 {
            let tmp = unPlaceBoard[index - 1]
            let r = tmp.first!,c = tmp.last!
            let item = self.board[r][c]
            removePlace(r, c)
            let num = item.wholeNumberValue ?? 0
            if num > 0 {
                var n = num + 1
                while n < 10 {
                    let ch = Character(String(n))
                    if canPlace(r, c, item: ch) {
                        place(r, c, item: ch)
                        return index - 1
                    }
                    n = n + 1
                }
                if n >= 10 {
                    return backtrack(index - 1)
                }
            }
        }
        return -1
    }
    
    private func removePlace(_ i: Int, _ j: Int) {
        let item = self.board[i][j]
        self.board[i][j] = "."
        let num = item.wholeNumberValue ?? 0
        let boxIndex = self.boxIndex(i, j)
        rowCounters[i] ^= (1<<num)
        columnCounters[j] ^= (1<<num)
        boxCounters[boxIndex] ^= (1<<num)
    }
    
    private func solve(_ i: Int,_ j: Int) -> Bool {
        for num in 1..<10 {
            let ch = Character(String(num))
            if canPlace(i, j, item: ch) {
                place(i, j, item: ch)
                return true
            }
        }
        return false
    }
    
    private func boxIndex(_ i: Int,_ j: Int) -> Int {
        
        return i / 3 * 3 + j / 3
    }
    
    private func canPlace(_ i: Int,_ j: Int, item: Character) -> Bool {
        let num = item.wholeNumberValue!
        let boxIndex = self.boxIndex(i, j)
        return  (rowCounters[i] & (1<<num) == 0) && (columnCounters[j] & (1<<num) == 0) && (boxCounters[boxIndex] & (1<<num) == 0)
    }
    
    private func place(_ i: Int,_ j: Int, item: Character) {
        self.board[i][j] = item
        let num = item.wholeNumberValue!
        let boxIndex = self.boxIndex(i, j)
        rowCounters[i] |= 1<<num
        columnCounters[j] |= 1<<num
        boxCounters[boxIndex] |= 1<<num
    }
    
    private func fillCounters(_ board: [[Character]]) {
        // 存储当前行，列，9宫格内已填数字信息
       for (i,row) in board.enumerated() {
           for (j,item) in row.enumerated() {
               if item != "." {
                   let num = item.wholeNumberValue!
                   rowCounters[i] |= 1<<num
                   columnCounters[j] |= 1<<num
                   let boxIndex = self.boxIndex(i,j)
                   boxCounters[boxIndex] |= 1<<num
               } else {
                   unPlaceBoard.append([i,j])
               }
           }
       }
    }
}
