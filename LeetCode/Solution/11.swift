//
//  11.swift
//  LeetCode
//
//  Created by persen on 2019/8/30.
//  Copyright © 2019 persen. All rights reserved.
//

import Foundation

//给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
//示例:
//
//输入: [1,8,6,2,5,4,8,3,7]
//输出: 49
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/container-with-most-water
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
class Solution11 {
    
    //穷举
//    func maxArea(_ heights: [Int]) -> Int {
//        var maxArea = 0
//        for (i,h) in heights.enumerated() {
//            var j = i + 1
//            while j < heights.count {
//                let area = (j - i) * min(h, heights[j])
//                maxArea = max(maxArea, area)
//                j+=1
//            }
//        }
//        return maxArea
//    }
    
    //双指针
    func maxArea(_ heights: [Int]) -> Int {
        var maxArea = 0,l = 0, r = heights.count - 1
        while l < r {
            maxArea = max(maxArea,min(heights[l], heights[r]) * (r - l))
            if heights[l] < heights[r] {
                l+=1
            } else {
                r-=1
            }
        }
        return maxArea
    }
}
