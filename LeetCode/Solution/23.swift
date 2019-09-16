//
//  23.swift
//  LeetCode
//
//  Created by persen on 2019/9/16.
//  Copyright © 2019 persen. All rights reserved.
//

//合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。
//
//示例:
//
//输入:
//[
//  1->4->5,
//  1->3->4,
//  2->6
//]
//输出: 1->1->2->3->4->4->5->6
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/merge-k-sorted-lists
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
import Foundation

class Solution23 {
    //两两合并
//    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//        if lists.count == 0 {
//            return nil
//        }
//        if lists.count == 1 {
//            return  lists.first!
//        }
//        var newLists = lists
//        let lastNode = newLists.removeLast()
//        let list = mergeKLists(newLists)
//        return merge2List(lastNode, list)
//    }
    
    private func merge2List(_ list1: ListNode?,_ list2: ListNode?) -> ListNode? {
        let root = ListNode(0)
        var list1 = list1,list2 = list2
        var proot: ListNode? = root
        while list1 != nil && list2 != nil {
            if(list1!.val > list2!.val) {
                proot!.next = ListNode(list2!.val)
                list2 = list2?.next
            } else if (list1!.val < list2!.val) {
                proot!.next = ListNode(list1!.val)
                list1 = list1?.next
            } else {
                proot!.next = ListNode(list1!.val)
                proot = proot?.next
                proot!.next = ListNode(list2!.val)
                list2 = list2?.next
                list1 = list1?.next
            }
            proot = proot?.next
        }
        
        var leftNode: ListNode? = nil
        if list1 != nil {
            leftNode = list1
        }
        if list2 != nil {
            leftNode = list2
        }
        while leftNode != nil {
            proot!.next = ListNode(leftNode!.val)
            leftNode = leftNode?.next
            proot = proot?.next
        }
        return root.next
    }
    
    //分治
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var lists = lists
        while lists.count > 1 {
            var l = 0
            var r = lists.count - 1
            while l < r {
                lists[l] = merge2List(lists[l], lists[r])
                lists.removeLast()
                l+=1
                r-=1
            }
        }
        return  lists.count > 0 ? lists.first!  : nil
    }
    
    //优先队列
}
