//
//  WithdrawViewController.swift
//  Mandiri
//
//  Created by user on 21/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit

class WithdrawViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    @IBOutlet weak var viewHistory: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backPage(_ sender: Any) {
        self.dismissPage()
    }
        @IBAction func indexTesx(_ sender: Any) {
            switch segmentedControl.selectedSegmentIndex
            {
            case 0:
                viewHistory.isHidden = true
            case 1:
                viewHistory.isHidden = false
            default:
                break
            }
        }
}

extension WithdrawViewController {
    static func navigateToModule(_ caller: UIViewController) {
        let sb = UIStoryboard(name:"Dashboard",bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "WithdrawViewController") as! WithdrawViewController
        caller.presentDetail(vc)
        
    }
}
