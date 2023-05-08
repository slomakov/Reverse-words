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
    var rule: ExclusionRule = .defaultReverse
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        textToIgnoreField.isHidden = true
    }

    @IBAction func ruleSwitched(_ sender: UISegmentedControl) {
        defaultExcludeLabel.isHidden = defaultToCustomToggle.selectedSegmentIndex == 1
        textToIgnoreField.isHidden = defaultToCustomToggle.selectedSegmentIndex == 0
        rule = ExclusionRule(rawValue: defaultToCustomToggle.selectedSegmentIndex) ?? .defaultReverse
        textEditingChange()
    }

    @IBAction func textRevertEditingChange(_ sender: UITextField) {
        textEditingChange()
    }

    @IBAction func textExcludeEditingChange(_ sender: UITextField) {
        textEditingChange()
    }

    private func textEditingChange() {
        guard let textToReverse = toReverseTextField.text else {
            return
        }
        guard let excludeInReverse = textToIgnoreField.text else {
            return
        }
        reversedTextLabel.text = reverseModel.reverseString(textToReverse, rule: rule, exclude: excludeInReverse)
    }
}
