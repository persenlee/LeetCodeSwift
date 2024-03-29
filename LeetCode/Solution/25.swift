//
//  25.swift
//  LeetCode
//
//  Created by persen on 2019/9/16.
//  Copyright © 2019 persen. All rights reserved.
//
//给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。
//
//k 是一个正整数，它的值小于或等于链表的长度。
//
//如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。
//
//示例 :
//
//给定这个链表：1->2->3->4->5
//
//当 k = 2 时，应当返回: 2->1->4->3->5
//
//当 k = 3 时，应当返回: 3->2->1->4->5
//
//说明 :
//
//你的算法只能使用常数的额外空间。
//你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/reverse-nodes-in-k-group
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
import Foundation

class Solution25 {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if k <= 1 {
            return head
        }
        var gHead = head
        let root = ListNode(0)
        var groupHead: ListNode? = root
        while true {
            var i = 0
            var gP = gHead
            var gTail = gP
            while i < k && gP != nil{
                gTail = gP
                gP = gP?.next
                i+=1
            }
            if i < k {
                groupHead?.next = gHead
                break
            } else {
                gTail?.next = nil
                groupHead?.next = reverse(gHead)
                groupHead = gHead
                gHead = gP
            }
        }
        return root.next
    }
    
    private func reverse(_ head: ListNode?) -> ListNode? {
        var prevNode = head
        var curNode = head?.next
        prevNode?.next = nil
        while curNode != nil {
            let tempNode = curNode?.next
            curNode?.next = prevNode
            prevNode = curNode
            curNode = tempNode
        }
        return prevNode
    }
}
