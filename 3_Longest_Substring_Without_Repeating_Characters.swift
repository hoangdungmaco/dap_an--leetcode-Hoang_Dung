//https://leetcode.com/problems/longest-substring-without-repeating-characters/


import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var length = 0, chars = [Character]()
        s.forEach({
            if chars.contains($0) {
                chars.removeSubrange(0...chars.firstIndex(of: $0)!)
            }
            chars.append($0)
            length = max(length, chars.count)
        })
        return length
    }
}
