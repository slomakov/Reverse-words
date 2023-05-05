//
//  ReverseModel.swift
//  Reverse words
//
//  Created by Stanislav Lomakov on 22.03.2023.
//

import Foundation

struct ReverseModel {

    func reverseString(_ words: String, rule: ExclusionRules, exclude: String = "") -> String {
        let result = words.components(separatedBy: " ")
            .map { reverseStringSwapAt($0, rule: rule, exclude: exclude) }
            .joined(separator: " ")
        return String(result)
    }

    private func reverseStringSwapAt(_ word: String, rule: ExclusionRules, exclude: String) -> String {
        guard !word.isEmpty else {
            return word
        }

        var shouldSkipCharReverse: ((Character, String) -> Bool)
        var characters: [Character] = Array(word)
        var leftIndex = 0
        var rightIndex = characters.count - 1

        shouldSkipCharReverse = exclude.isEmpty ? reverseDefault : reverseCustom

        if rule == .customReverse && exclude.isEmpty {
            return String(word.reversed())
        }

        while leftIndex < rightIndex {
            if shouldSkipCharReverse(characters[leftIndex], exclude) {
                leftIndex += 1
            } else if shouldSkipCharReverse(characters[rightIndex], exclude) {
                rightIndex -= 1
            } else {
                characters.swapAt(leftIndex, rightIndex)
                leftIndex += 1
                rightIndex -= 1
            }
        }

        return String(characters)
    }

    private func reverseCustom(_ char: Character, _ exclude: String) -> Bool {
        return exclude.contains(char)
    }

    private func reverseDefault(_ char: Character, _ exclude: String) -> Bool {
        return !char.isLetter
    }
}

enum ExclusionRules {
    case defaultReverse, customReverse
}
