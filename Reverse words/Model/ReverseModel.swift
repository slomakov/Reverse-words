//
//  ReverseModel.swift
//  Reverse words
//
//  Created by Stanislav Lomakov on 22.03.2023.
//

import Foundation

struct ReverseModel {
    func reverseString(_ words: String) -> String {
        let result = words.components(separatedBy: " ")
            .map { $0.reversed() }
            .joined(separator: " ")
        return String(result)
    }
}
