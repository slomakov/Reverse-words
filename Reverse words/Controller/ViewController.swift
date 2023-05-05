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
    var rule: ExclusionRules = .defaultReverse
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        textToIgnoreField.isHidden = true
    }

    
    @IBAction func ruleSwitched(_ sender: UISegmentedControl) {
        if defaultToCustomToggle.selectedSegmentIndex == 0 {
            defaultExcludeLabel.isHidden = false
            textToIgnoreField.isHidden = true
            rule = .defaultReverse
            textEditingChange()
        } else if defaultToCustomToggle.selectedSegmentIndex == 1 {
            defaultExcludeLabel.isHidden = true
            textToIgnoreField.isHidden = false
            rule = .customReverse
            textEditingChange()
        }
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
