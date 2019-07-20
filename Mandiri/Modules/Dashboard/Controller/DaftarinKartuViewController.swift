//
//  DaftarinKartuViewController.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit

class DaftarinKartuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
  
    @IBAction func daftarrAction(_ sender: Any) {
        
    }
}

extension DaftarinKartuViewController {
    static func navigateToModule(_ caller: UIViewController) {
        let sb = UIStoryboard(name:"Dashboard",bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DaftarinKartuViewController") as! DaftarinKartuViewController
        caller.presentDetail(vc)
    }
}
