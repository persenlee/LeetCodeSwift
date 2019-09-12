
//
//  Intalindrome.swift
//  LeetCode
//
//  Created by persen on 2019/8/22.
//  Copyright © 2019 persen. All rights reserved.
//

import Foundation

class Solution9 {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        } else if x < 10 {
            return true
        } else {
            let s = String(x)
            var l = 0, r = s.count - 1
            while l < r {
                let lIndex = s.index(s.startIndex, offsetBy: l)
                let rIndex = s.index(s.startIndex, offsetBy: r)
                if s[lIndex] != s[rIndex] {
                    return false
                }
                l+=1
                r-=1
            }
            return true
        }
    }
}
