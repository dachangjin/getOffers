//
//  main.swift
//  14_1_cuttingRope
//
//  Created by tommywwang on 2021/5/21.
//

import Foundation

class Solution {
    
    var cuttedLength = 0
    var max = 0
    var n = 0
    var pieces = [Int]()
    
    func cuttingRope(_ n: Int) -> Int {
        max = 0
        self.n = n
        dfs()
        return max
    }
    
    func dfs() {
        if cuttedLength == self.n {
            var result = 0
            if self.pieces.count <= 1 {
                result = 0
            } else {
                result = 1
                for num in self.pieces {
                    result *= num
                }
            }
            if result > max {
                max = result
            }
            return
        }
        for num in 1...self.n - self.cuttedLength {
            self.pieces.append(num)
            self.cuttedLength += num
            dfs()
            self.pieces.removeLast()
            self.cuttedLength -= num
        }
    }
}

let sol = Solution()
print(sol.cuttingRope(22))
