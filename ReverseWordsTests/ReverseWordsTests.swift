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

    func testReverseWords() {
        let cases: [(data: String, expected: String)] = [
            ("qwer", "rewq"),
            ("QWER", "REWQ"),
            ("qw er", "wq re"),
            ("qw  er", "wq  re"),
            ("12345", "54321"),
            ("!@#$", "$#@!"),
            ("Qwe123!@#  123", "#@!321ewQ  321")
        ]

        cases.forEach({ testData, expectedResult in
            let result = reverseModel.reverseString(testData)

            XCTAssertEqual(result, expectedResult,
                           "Values did not math: Expected - \(expectedResult), but found \(result) ")
        })
    }
}
