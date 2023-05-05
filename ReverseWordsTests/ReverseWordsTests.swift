//
//  ReverseWordsTests.swift
//  ReverseWordsTests
//
//  Created by Stanislav Lomakov on 19.04.2023.
//

import XCTest
@testable import Reverse_words

final class ReverseWordsTests: XCTestCase {
    let reverseModel = ReverseModel()

    func testReverseWordsAnagramsCustom() {
        let cases: [(entryString: String, excluded: String, expected: String)] = [
            ("Foxminded cool 24/7", "xl", "dexdnimoF oocl 7/42"),
            ("Foxminded  cool  24/7", "xl", "dexdnimoF  oocl  7/42"),
            ("abcd efgh", "xl", "dcba hgfe"),
            ("!@#$", "xl", "$#@!"),
            ("12345", "q", "54321"),
            ("!@#$12345qwe", "@4", "e@wq53241$#!"),
            ("a1bcd efglh", "xl", "dcb1a hgfle")
        ]

        cases.forEach({ entryString, excluded, expectedResult in
            let result = reverseModel.reverseString(entryString, rule: .customReverse, exclude: excluded)

            XCTAssertEqual(result, expectedResult,
                           "Values did not math: Expected - \(expectedResult), but found \(result) ")
        })
    }

    func testReverseWordsAnagramsDefault() {
        let cases: [(entryString: String, expected: String)] = [
            ("Foxminded cool 24/7", "dednimxoF looc 24/7"),
            ("Foxminded  cool  24/7", "dednimxoF  looc  24/7"),
            ("abcd efgh", "dcba hgfe"),
            ("a1bcd efg!h", "d1cba hgf!e"),
            ("12345", "12345"),
            ("qw  er", "wq  re"),
            ("123!a@#$", "123!a@#$"),
            ("123!a@#b$", "123!b@#a$"),
            ("!@#$", "!@#$")
        ]

        cases.forEach({ entryString, expectedResult in
            let result = reverseModel.reverseString(entryString, rule: .defaultReverse)

            XCTAssertEqual(result, expectedResult,
                           "Values did not math: Expected - \(expectedResult), but found \(result) ")
        })
    }
}
