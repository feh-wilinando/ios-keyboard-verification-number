//
//  ViewController.swift
//  PocKeyboard
//
//  Created by Fernando Furtado on 20/08/18.
//  Copyright © 2018 feh-wilinando. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    
    @IBOutlet var verificationCodeFields: [UITextField]!    
    @IBOutlet weak var inputCodeField: UITextField!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        inputCodeField.delegate = self

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        inputCodeField.becomeFirstResponder()
    }
}

extension ViewController: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = textField.text, let textRange = Range(range, in: text) else {
            print("Don't let")
            return false
        }

        let updatedText = text.replacingCharacters(in: textRange, with: string)





        let remaining = verificationCodeFields.count - updatedText.count
        let fillSpaces = String(repeating: " ", count: remaining)

        for (field, value) in zip(verificationCodeFields, (updatedText + fillSpaces) ) {
            field.text = String(value)
        }

        if updatedText.count == 6 {
            print("End!!")
            textField.resignFirstResponder()

        }

        return true
    }
}
