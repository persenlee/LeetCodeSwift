
//
//  34.swift
//  LeetCode
//
//  Created by persen on 2019/12/21.
//  Copyright © 2019 persen. All rights reserved.
//
//给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
//
//你的算法时间复杂度必须是 O(log n) 级别。
//
//如果数组中不存在目标值，返回 [-1, -1]。
//
//示例 1:
//
//输入: nums = [5,7,7,8,8,10], target = 8
//输出: [3,4]
//示例 2:
//
//输入: nums = [5,7,7,8,8,10], target = 6
//输出: [-1,-1]
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
import Foundation

class Solution34 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count == 0 || target < nums.first! || target > nums.last! {
            return [-1,-1]
        }
        var s = 0,e = nums.count - 1
        var tIndex = -1
        while s <= e {
            let m = (s + e) / 2
            if nums[m] == target {
                tIndex = m
                break
            } else if nums[m] > target {
                e = m - 1
            } else {
                s = m + 1
            }
        }
        if tIndex == -1 {
            return [-1,-1]
        } else {
            let leftRange = searchRange(Array(nums[s..<tIndex]), target)
            var left = tIndex,right = tIndex
            if leftRange.first! != -1 {
                left = s + leftRange.first!
            }
            let rightRange = searchRange(Array(nums[tIndex+1..<e+1]), target)
            if rightRange.first! != -1 {
                right = tIndex + rightRange.last! + 1
            }
            return [left,right]
        }
    }
}
