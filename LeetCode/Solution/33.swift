//
//  33.swift
//  LeetCode
//
//  Created by persen on 2019/12/20.
//  Copyright © 2019 persen. All rights reserved.
//
//假设按照升序排序的数组在预先未知的某个点上进行了旋转。
//
//( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
//
//搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
//
//你可以假设数组中不存在重复的元素。
//
//你的算法时间复杂度必须是 O(log n) 级别。
//
//示例 1:
//
//输入: nums = [4,5,6,7,0,1,2], target = 0
//输出: 4
//示例 2:
//
//输入: nums = [4,5,6,7,0,1,2], target = 3
//输出: -1
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/search-in-rotated-sorted-array
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
import Foundation

class Solution33 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return -1;
        }
        if nums.count == 1 {
            return nums.first! == target ? 0 : -1
        }
        //找到旋转点
        let rotate = findRotateIndex(nums)
        if rotate == -1 {
            return find(nums, target)
        }
        //折半查找
        if target >= nums[rotate] && target <= nums.last! {
            let res = find(Array(nums[rotate..<nums.count]), target)
            return res == -1 ? res : rotate + res
        } else if target <= nums[rotate - 1] && target >= nums.first! {
            return find(Array(nums[0..<rotate]), target)
        }
        return -1
    }
    
    private func find(_ nums: [Int], _ target: Int) -> Int {
        let mid = nums.count / 2
        if mid == 0 && nums[mid] != target {
            return -1
        }
        if nums[mid] == target {
            return mid
        } else if nums[mid] > target {
            return find(Array(nums[0..<mid]), target)
        } else {
            let res = find(Array(nums[mid..<nums.count]), target)
            return res == -1 ? res : mid + res
        }
    }
    
    private func findRotateIndex(_ nums: [Int]) -> Int {
        let mid = nums.count / 2
        if nums.count > 2 {
            if (nums[mid] > nums[mid - 1] && nums[mid] > nums[mid + 1]){
                return mid + 1
            } else if (nums[mid] < nums[mid - 1] && nums[mid] < nums[mid + 1]){
                return mid
            } else {
                let left = findRotateIndex(Array(nums[0..<mid]))
                let right = findRotateIndex(Array(nums[mid..<nums.count]))
                if left != -1 {
                    return left
                }
                if right != -1 {
                    return mid + right
                }
                return -1
            }
        } else if nums.count == 2 {
            if nums.first! < nums.last! {
                return -1
            } else {
                return 1
            }
        } else {
            return -1
        }
    }
}
