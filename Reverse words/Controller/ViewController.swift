//
//  ViewController.swift
//  Reverse words
//
//  Created by Stanislav Lomakov on 22.03.2023.
//

import UIKit

class ViewController: UIViewController {
    let reverseModel = ReverseModel()

    @IBOutlet weak var toReverseTextField: UITextField!
    @IBOutlet weak var defaultToCustomToggle: UISegmentedControl!
    @IBOutlet weak var textToIgnoreField: UITextField!
    @IBOutlet weak var reversedTextLabel: UILabel!
    @IBOutlet weak var defaultExcludeLabel: UILabel!
    
    private func bind() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

    private func configure() {
        textToIgnoreField.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        configure()
    }

    
    @IBAction func ruleSwitched(_ sender: UISegmentedControl) {
        if defaultToCustomToggle.selectedSegmentIndex == 0 {
            defaultExcludeLabel.isHidden = false
            textToIgnoreField.isHidden = true
        } else if defaultToCustomToggle.selectedSegmentIndex == 1 {
            defaultExcludeLabel.isHidden = true
            textToIgnoreField.isHidden = false
        }
        reversedTextLabel.text = ""
    }

    @IBAction func resultButtonPressed(_ sender: UIButton) {
        guard let textToReverse = toReverseTextField.text else {
            return
        }

        var reversedText: String

        if defaultToCustomToggle.selectedSegmentIndex == 0 {
            reversedText = reverseModel.reverseString(textToReverse, rule: .defaultReverse)
        } else {
            guard let excludeInReverse = textToIgnoreField.text else {
                return
            }
            reversedText = reverseModel.reverseString(textToReverse, rule: .customReverse, exclude: excludeInReverse)
        }
        reversedTextLabel.text = reversedText
    }
}
