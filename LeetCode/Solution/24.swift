//
//  24.swift
//  LeetCode
//
//  Created by persen on 2019/9/16.
//  Copyright © 2019 persen. All rights reserved.
//
//给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
//
//你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
//
//
//
//示例:
//
//给定 1->2->3->4, 你应该返回 2->1->4->3.
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/swap-nodes-in-pairs
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

import Foundation
class Solution24 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let root = ListNode(0)
        root.next = head
        var p1: ListNode? = root
        while p1 != nil {
            let temp = p1!.next
            let p2 = p1!.next?.next
            let p3 = p2?.next
            temp?.next = p3
            if p2 != nil {
                p1!.next = p2
                p1?.next?.next = temp
            }
            p1 = temp
        }
        return root.next
    }
}

