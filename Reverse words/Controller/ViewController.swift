//
//  ViewController.swift
//  Reverse words
//
//  Created by Stanislav Lomakov on 22.03.2023.
//

import UIKit

class ViewController: UIViewController {
    let reverseModel = ReverseModel()

    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var textToReverseTextField: UITextField!
    @IBOutlet weak var reversedTextLabel: UILabel!
    @IBOutlet weak var textFieldBottomBorder: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textToReverseTextField.addTarget(self, action: #selector(disableReverseButtonIfNoText), for: .editingChanged)
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

    @IBAction func reverseButtonPressed(_ sender: UIButtonWithState) {
        if !sender.isReversed {
            reversedTextLabel.text = reverseModel.reverseString(textToReverseTextField.text!)
            sender.setTitle("Clear", for: .normal)
            sender.isReversed = true
            textToReverseTextField.endEditing(true)
            textFieldBottomBorder.backgroundColor = UIColor.gray
        } else {
            textToReverseTextField.text?.removeAll()
            reversedTextLabel.text?.removeAll()
            reverseButton.isEnabled = false
            sender.setTitle("Reverse", for: .normal)
            sender.isReversed = false
        }
    }

    @IBAction func editingDidBegan(_ sender: UITextField) {
        textFieldBottomBorder.backgroundColor = UIColor.blue
    }

    @objc func disableReverseButtonIfNoText(sender: UITextField) {
        sender.text = sender.text
        guard
            let text = textToReverseTextField.text, !text.isEmpty
            else
        {
            reverseButton.isEnabled = false
            return
        }
        reverseButton.isEnabled = true
    }
}
