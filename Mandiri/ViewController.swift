//
//  ViewController.swift
//  Mandiri
//
//  Created by user on 19/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        OnboardingViewController.navigateToModule(self)
    }
}

