//
//  19.swift
//  LeetCode
//
//  Created by persen on 2019/9/12.
//  Copyright © 2019 persen. All rights reserved.
//
//给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。
//
//示例：
//
//给定一个链表: 1->2->3->4->5, 和 n = 2.
//
//当删除了倒数第二个节点后，链表变为 1->2->3->5.
//说明：
//
//给定的 n 保证是有效的。
//
//进阶：
//
//你能尝试使用一趟扫描实现吗？
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
import Foundation

class Solution19 {
//    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
//        var array = Array<ListNode>()
//        var rootNode = head
//        while rootNode != nil {
//            array.append(rootNode!)
//            rootNode = rootNode?.next
//        }
//        if n <= array.count && n > 0 {
//            let index = array.count - n
//            let removeNode = array[index]
//            if index == 0 {
//                return removeNode.next
//            }
//            let prevNode = array[index - 1]
//            prevNode.next = removeNode.next
//            return head
//        }
//        return nil
//    }
    
    //双指针
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var n = n
        var first: ListNode?
            first = dummy
        var second: ListNode?
            second = dummy
        while n >= 0 {
            first = first?.next
            n -= 1
        }
        
        while first != nil {
            first = first?.next
            second = second?.next
        }
        second?.next = second?.next?.next
        return dummy.next
    }
}
