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
            return false
        }
        return self.verifyPostorder(postorder, from: 0, end: postorder.count - 1)
    }
    
    func verifyPostorder(_ postorder: [Int], from: Int, end: Int) -> Bool {
        if from == end {
            return false
        }
        if end - from == 1 {
            return true
        }
        let head = postorder[end]
        var left = from
        for index in from...end - 1 {
            if postorder[index] > head {
                left = index
                break
            }
        }
        for index in left...end - 1 {
            if postorder[index] < head {
                return false
            }
        }
        return verifyPostorder(postorder, from: from, end: left) &&
            verifyPostorder(postorder, from: left + 1, end: end)
    }
}

