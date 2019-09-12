//
//  main.swift
//  LeetCode
//
//  Created by persen on 2019/8/19.
//  Copyright © 2019 persen. All rights reserved.
//

import Foundation


let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
node1.next = node2
node2.next = node3

let res = Solution19().removeNthFromEnd(node1, 1)
