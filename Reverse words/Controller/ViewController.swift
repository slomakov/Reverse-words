//
//  ViewController.swift
//  Reverse words
//
//  Created by Stanislav Lomakov on 22.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let rm = ReverseModel()

    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var textToReverse: UITextField!
    @IBOutlet weak var reversedText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isTextFieldEmpty()
    }


    @IBAction func reverseButtonPressed(_ sender: UIButton) {
        if let titleLabel = sender.titleLabel {
            if titleLabel.text == "Reverse" {
                reversedText.text = rm.reverseString(textToReverse.text!)
                sender.setTitle("Clear", for: .normal)
            } else if titleLabel.text == "Clear" {
                textToReverse.text?.removeAll()
                reversedText.text?.removeAll()
                isTextFieldEmpty()
                sender.setTitle("Reverse", for: .normal)
            }
        }
    }
    
    func isTextFieldEmpty() {
        reverseButton.isEnabled = false
        textToReverse.addTarget(self, action: #selector(textFieldIsNotEmpty), for: .editingChanged)
       }
    
    @objc func textFieldIsNotEmpty(sender: UITextField) {

        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        guard
          let text = textToReverse.text, !text.isEmpty
          
          else
        {
          self.reverseButton.isEnabled = false
          return
        }
        reverseButton.isEnabled = true
       }
}

