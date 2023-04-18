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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textToReverseTextField.addTarget(self, action: #selector(disableReverseButtonIfNoText), for: .editingChanged)
        textToReverseTextField.addBottomBorder()
    }

    @IBAction func reverseButtonPressed(_ sender: UIButtonWithState) {
        if !sender.isReversed {
            reversedTextLabel.text = reverseModel.reverseString(textToReverseTextField.text!)
            sender.setTitle("Clear", for: .normal)
            sender.isReversed = true
            textToReverseTextField.endEditing(true)
            textToReverseTextField.addBottomBorder(color: UIColor.gray)
        } else {
            textToReverseTextField.text?.removeAll()
            reversedTextLabel.text?.removeAll()
            reverseButton.isEnabled = false
            sender.setTitle("Reverse", for: .normal)
            textToReverseTextField.addBottomBorder(color: UIColor.gray)
            sender.isReversed = false
        }
    }

    @IBAction func editingDidBegan(_ sender: UITextField) {
        textToReverseTextField.addBottomBorder(color: UIColor.blue)
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

extension UITextField {
    func addBottomBorder(color: UIColor = UIColor.gray) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 3)
        bottomLine.backgroundColor = color.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
