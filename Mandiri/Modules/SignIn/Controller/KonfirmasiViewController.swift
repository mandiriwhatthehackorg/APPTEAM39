//
//  KonfirmasiViewController.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit

class KonfirmasiViewController: UIViewController {
    @IBOutlet weak var FirstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var thirdText: UITextField!
    @IBOutlet weak var fourthText: UITextField!
    @IBOutlet weak var FiveText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backPage(_ sender: Any) {
        self.dismissPage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupTextfield()
    }


}

extension KonfirmasiViewController {
    static func navigateToModule(_ caller: UIViewController) {
        let sb = UIStoryboard(name:"Signin",bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "KonfirmasiViewController") as! KonfirmasiViewController
        caller.presentDetail(vc)
    }
}

extension KonfirmasiViewController : UITextFieldDelegate {
    func setupTextfield(){
        self.FirstText.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        self.secondText.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        self.thirdText.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        self.fourthText.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        self.FiveText.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == self.FirstText {
            return self.maxlenghtField(textField, range: range, replacementString: string, max: 1)
        }
        if textField == self.secondText {
            
            return self.maxlenghtField(textField, range: range, replacementString: string, max: 1)
        }
        if textField == self.thirdText {
            return self.maxlenghtField(textField, range: range, replacementString: string, max: 1)
        }
        if textField == self.fourthText {
            return self.maxlenghtField(textField, range: range, replacementString: string, max: 1)
        }
        
        if textField == self.FiveText {
            return self.maxlenghtField(textField, range: range, replacementString: string, max: 1)
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        
        let text = textField.text
        
        if text?.utf16.count ?? 0 >= 1{
            switch textField{
            case self.FirstText:
                self.secondText.becomeFirstResponder()
            case self.secondText:
                self.thirdText.becomeFirstResponder()
            case self.thirdText:
                self.fourthText.becomeFirstResponder()
            case self.fourthText:
                self.FiveText.becomeFirstResponder()
            default:
                break
            }
        }else{
            
        }
        self.setNextPage()
    }
    
    func setNextPage()  {
        if self.FirstText.text != "" {
            if self.secondText.text != "" {
                if self.thirdText.text != "" {
                    if self.fourthText.text != "" {
                        if self.FiveText.text != "" {
                            DaftarinKartuViewController.navigateToModule(self)
                        }
                    }
                }
            }
        }
    }
}
extension KonfirmasiViewController {
    func maxlenghtField(_ textfield: UITextField, range: NSRange, replacementString: String, max: Int) -> Bool {
        if textfield.text?.count == 0 {
            return replacementString.rangeOfCharacter(from: .whitespacesAndNewlines) == nil
        }
        let maxLength = max
        let currentString: NSString = textfield.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: replacementString) as NSString
        
        
        return newString.length <= maxLength
    }
}
