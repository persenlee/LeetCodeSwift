//
//  main.swift
//  LeetCode
//
//  Created by persen on 2019/8/19.
//  Copyright © 2019 persen. All rights reserved.
//

import Foundation


//let node1 = ListNode(1)
//let node2 = ListNode(2)
//let node3 = ListNode(3)
//node1.next = node2
//node2.next = node3


//
//let res = Solution19().removeNthFromEnd(node1, 1)

//let res = Solution20().isValid("")


//let res = Solution22().generateParenthesis(3)

let n1 = ListNode(1)
n1.next = ListNode(2)
n1.next?.next = ListNode(3)
n1.next?.next?.next = ListNode(4)

let n2 = ListNode(1)
n2.next = ListNode(3)
n2.next?.next = ListNode(4)

let n3 = ListNode(2)
n3.next = ListNode(6)

//let res = Solution23().mergeKLists([n1,n2,n3])

let res = Solution24().swapPairs(ListNode(1))
print(res?.discription())
