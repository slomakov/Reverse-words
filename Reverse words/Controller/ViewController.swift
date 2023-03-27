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
        disableReverseButtonIfNoText()
    }
    
    @IBAction func reverseButtonPressed(_ sender: UIButtonWithState) {
        if !sender.isReversed {
            reversedTextLabel.text = reverseModel.reverseString(textToReverseTextField.text!)
            sender.setTitle("Clear", for: .normal)
            sender.isReversed = true
        } else {
            textToReverseTextField.text?.removeAll()
            reversedTextLabel.text?.removeAll()
            disableReverseButtonIfNoText()
            sender.setTitle("Reverse", for: .normal)
            sender.isReversed = false
        }
    }
    
    func disableReverseButtonIfNoText() {
        reverseButton.isEnabled = false
        textToReverseTextField.addTarget(self, action: #selector(disableReverseButton), for: .editingChanged)
       }
    
    @objc func disableReverseButton(sender: UITextField) {

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
