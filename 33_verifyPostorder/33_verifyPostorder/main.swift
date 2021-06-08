//
//  main.swift
//  33_verifyPostorder
//
//  Created by tommywwang on 2021/6/8.
//

import Foundation

class Solution {
    func verifyPostorder(_ postorder: [Int]) -> Bool {
        if postorder.count == 0 {
            return true
        }
        return self.verifyPostorder(postorder, from: 0, end: postorder.count - 1)
    }
    
    func verifyPostorder(_ postorder: [Int], from: Int, end: Int) -> Bool {
        if from >= end {
            return true
        }
        if end - from == 1 {
            return true
        }
        let head = postorder[end]
        var i = from
        for index in from...end - 1 {
            if postorder[index] > head {
                break
            }
            i += 1
        }
        for index in i..<end {
            if postorder[index] < head {
                return false
            }
        }
        var left = true
        if i > 0 {
            left = verifyPostorder(postorder, from: from, end: i - 1)
        }
        var right = true
        if i < end - 1 {
            right = verifyPostorder(postorder, from: i , end: end - 1)
        }
        return left && right
    }
}

let sol = Solution()
print(sol.verifyPostorder([4, 8, 6, 12, 16, 14, 10]))

