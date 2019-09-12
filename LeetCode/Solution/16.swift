//
//  16.swift
//  LeetCode
//
//  Created by persen on 2019/9/9.
//  Copyright © 2019 persen. All rights reserved.
//

//给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
//
//例如，给定数组 nums = [-1，2，1，-4], 和 target = 1.
//
//与 target 最接近的三个数的和为 2. (-1 + 2 + 1 = 2).
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/3sum-closest
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

import Foundation

//[-4,-1,1,2]
class Solution16 {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var nums = nums.sorted()
        var i = 0
        var j = i + 1
        var k = nums.count - 1
        var sum = nums[i] + nums[j] + nums[k]
        var offset = abs(target - sum)
        while i < nums.count - 2 {
            if j > k {
                while i + 1 < nums.count && nums[i] == nums[i+1] {
                    i += 1
                }
                i += 1
                j = i + 1
                k = nums.count - 1
                continue
            }
            let s = nums[i] + nums[j] + nums[k]
            let o = abs(s - target)
            if o > offset {
                while k - 1 > 0 && nums[k] == nums[k - 1] {
                    k -= 1
                }
                k -= 1
                
            } else {
                sum = s
                offset = o
                while j + 1 < nums.count && nums[j] == nums[j + 1] {
                    j += 1
                }
                j += 1
            }
        }
        return sum;
    }
}
