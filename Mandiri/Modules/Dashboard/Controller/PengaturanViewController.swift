//
//  PengaturanViewController.swift
//  Mandiri
//
//  Created by user on 21/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit

class PengaturanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backPage(_ sender: Any) {
        self.dismissPage()
    }
    
}

extension PengaturanViewController {
    static func navigateToModule(_ caller: UIViewController) {
        let sb = UIStoryboard(name:"Dashboard",bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PengaturanViewController") as! PengaturanViewController
        caller.presentDetail(vc)
        
    }
}
