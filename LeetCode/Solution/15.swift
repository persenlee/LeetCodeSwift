//
//  15.swift
//  LeetCode
//
//  Created by persen on 2019/9/6.
//  Copyright © 2019 persen. All rights reserved.
//

//给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
//
//注意：答案中不可以包含重复的三元组。
//
//例如, 给定数组 nums = [-1, 0, ,1, 2, -1, -4]，
//
//满足要求的三元组集合为：
//[
//[-1, 0, 1],
//[-1, -1, 2]
//]
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/3sum
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

import Foundation

class Solution15 {
    //穷举
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//        var result = Array<Array<Int>>()
//        var i = 0
//        while i < nums.count {
//            var j = i + 1
//            while j < nums.count {
//                var k = j + 1
//                while k < nums.count {
//                    if (nums[i] + nums[j] + nums[k]) == 0 {
//                        let array = [nums[i],nums[j],nums[k]].sorted()
//                        if result.contains(array) == false {
//                            result.append(array)
//                        }
//                    }
//                    k += 1
//                }
//                j += 1
//            }
//            i += 1
//        }
//        return result
//    }

    
        func threeSum(_ nums: [Int]) -> [[Int]] {
            var result = Array<Array<Int>>()
            var nums = nums.sorted()
            var i = 0;
            var j = i + 1;
            var k = nums.count - 1
            while i < nums.count - 2 {
                if j >= k {
                    i = i + 1
                    j = i + 1
                    k = nums.count - 1
                    continue
                }
                let res = nums[i] + nums[j] + nums[k]
                if res > 0 {
                    k -= 1
                } else if res < 0 {
                    j += 1
                } else {
                    result.append([nums[i],nums[j],nums[k]])
                    while i + 1 < nums.count {
                        if  nums[i] != nums[i + 1] {
                            break
                        }
                        i += 1
                    }
                    
                    while k - 1 > 0 {
                        if nums[k] != nums[k - 1] {
                            break
                        }
                        k -= 1
                    }
                    j = i + 1
                    k -= 1
                }
            }
            
            return result
        }
  
    
}
