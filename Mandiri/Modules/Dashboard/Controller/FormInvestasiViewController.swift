//
//  FormInvestasiViewController.swift
//  Mandiri
//
//  Created by user on 21/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit

class FormInvestasiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension FormInvestasiViewController {
    static func navigateToModule(_ caller: UIViewController) {
        let sb = UIStoryboard(name:"Dashboard",bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "FormInvestasiViewController") as! FormInvestasiViewController
        caller.present(vc, animated: false, completion: nil)
        
    }
}
