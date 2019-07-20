//
//  SignInViewController.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit
class SignInViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func backPage(_ sender: Any) {
        self.dismissPage()
    }
    
   
    
}



extension SignInViewController {
    static func navigateToModule(_ caller: UIViewController) {
        let sb = UIStoryboard(name:"Signin",bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        caller.presentDetail(vc)
    }
}
