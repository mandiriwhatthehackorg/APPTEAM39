//
//  PopupSignInViewController.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit

class PopupSignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func SignInAction(_ sender: Any) {
        SignInViewController.navigateToModule(self)
    }
    
}

extension PopupSignInViewController {
    static func navigateToModule(_ caller: UIViewController) {
        let sb = UIStoryboard(name:"Activate",bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PopupSignInViewController") as! PopupSignInViewController
        caller.present(vc, animated: true, completion: nil)
    }
}
