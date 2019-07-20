//
//  InvestasiViewController.swift
//  Mandiri
//
//  Created by user on 21/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit

class InvestasiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func withDrawAction(_ sender: Any) {
        WithdrawViewController.navigateToModule(self)
    }
}

