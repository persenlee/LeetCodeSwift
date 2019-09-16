//
//  ListNode.swift
//  LeetCode
//
//  Created by persen on 2019/9/16.
//  Copyright © 2019 persen. All rights reserved.
//

import Foundation

//  Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public func discription() -> String? {
        var pNode: ListNode? = self
        var res = String()
        while pNode != nil {
            res += String(pNode!.val)
            if pNode!.next != nil {
                res += " -> "
            }
            pNode = pNode!.next
        }
        return res
    }
}
