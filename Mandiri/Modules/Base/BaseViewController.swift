//
//  BaseViewController.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit
protocol BaseView {
    
}

class BaseViewController: UIViewController {
  
    var basePresenter: BasePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.basePresenter?.attachedView(self)
        // Do any additional setup after loading the view.
    }

}

extension BaseViewController: BaseView {
    
}
