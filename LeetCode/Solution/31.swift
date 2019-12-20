//
//  31.swift
//  LeetCode
//
//  Created by persen on 2019/9/19.
//  Copyright © 2019 persen. All rights reserved.
//
//实现获取下一个排列的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。
//
//如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。
//
//必须原地修改，只允许使用额外常数空间。
//
//以下是一些例子，输入位于左侧列，其相应输出位于右侧列。
//1,2,3 → 1,3,2
//3,2,1 → 1,2,3
//1,1,5 → 1,5,1
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/next-permutation
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
import Foundation

class Solution31 {
    func nextPermutation(_ nums: inout [Int]) {
        var j = nums.count - 1
        
        while j > 0 {
            let current = nums[j]
            let before = nums[j - 1]
            if current > before {
                var i = j + 1
                while i < nums.count {
                    if nums[j - 1] >= nums[i] {
                        break
                    }
                    i+=1
                }
                 var s = j
                if i < nums.count {
                    nums.swapAt(j - 1, i - 1)
                } else {
                    if nums[j - 1] == nums.last {
                        nums.swapAt(j - 1, j)
                        s = j + 1
                    } else {
                        nums.swapAt(j - 1, i - 1)
                    }
                }
               
                var e = nums.count - 1
                while s < e {
                    nums.swapAt(s, e)
                    s+=1
                    e-=1
                }
                break
            }
            j -= 1
        }
        if j == 0 {
            nums.reverse()
        }
    }
}
