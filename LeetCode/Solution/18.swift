//
//  18.swift
//  LeetCode
//
//  Created by persen on 2019/9/11.
//  Copyright © 2019 persen. All rights reserved.
//
//给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。
//
//注意：
//
//答案中不可以包含重复的四元组。
//
//示例：
//
//给定数组 nums = [1, 0, -1, 0, -2, 2]，和 target = 0。
//
//满足要求的四元组集合为：
//[
//    [-1,  0, 0, 1],
//    [-2, -1, 1, 2],
//    [-2,  0, 0, 2]
//]
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/4sum
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
import Foundation

// [-2,-1,0,0,1,2]

class Solution18 {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result = Array<Array<Int>>()
//        var hash = Dictionary<Array<Int>,Int>()
        if nums.count >= 4 {
            for (i,digit) in nums.enumerated() {
                let targetThree = target - digit
                let array = threeSum(nums, targetThree,i)
                for arr2 in array {
                    var arr3 = Array<Int>(arr2)
                    arr3.append(digit)
                    arr3 = arr3.sorted()
                    if result.contains(arr3) == false {
                        result.append(arr3)
                    }
                }
            }
        }
        return result
    }
    
    private func threeSum(_ nums: [Int], _ target: Int,_ exceptIndex: Int) -> [[Int]] {
        var result = Array<Array<Int>>()
        if nums.count >= 3 {
//            var hash = Dictionary<Array<Int>,Int>()
            for (i,digit) in nums.enumerated() {
                if i == exceptIndex {
                    continue
                }
                let targetTwo = target - digit
                
                let array = twoSum(nums, targetTwo,[i,exceptIndex])
                for arr2 in array {
                    var arr3 = Array<Int>(arr2)
                    arr3.append(digit)
                    arr3 = arr3.sorted()
                    if result.contains(arr3) == false {
                        result.append(arr3)
                    }
                    
                }
            }
        }
        return result
    }
    
    private func twoSum(_ nums: [Int], _ target: Int, _ exceptIndexs: [Int]) -> [[Int]] {
        var result = Array<Array<Int>>()
        if nums.count >= 2 {
            var hash = Dictionary<Int,Array<Int>>()
            for (i,digit) in nums.enumerated() {
                if exceptIndexs.contains(i) {
                    continue
                }
                //hash冲突
                if let t = hash[digit] {
                    var arr = Array<Int>(t)
                    arr.append(i)
                    hash[digit] = arr
                } else {
                     hash[digit] = [i]
                }
               
                let num = target - digit
                if let value = hash[num] {
                    for j in value {
                        if !exceptIndexs.contains(j) && i != j{
                            result.append([digit,nums[j]])
                        }
                    }
                }
            }
        }
        return result
    }
}
