//
//  PalindromeFinder.swift
//  Palindromes
//
//  Created by Мирошниченко Марина on 26.02.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import Foundation

class PalindromeFinder {
    func findPalindromes(inText text: String) -> [String] {
        var palindromes: [String] = []
        
        for word in text.components(separatedBy: " ") {
                if isPalindrome(word: word) {
                    palindromes.append(word)
                }
        }
        return palindromes
    }
    
    private func isPalindrome(word: String) -> Bool {
        return word == String(word.reversed())
    }
}
