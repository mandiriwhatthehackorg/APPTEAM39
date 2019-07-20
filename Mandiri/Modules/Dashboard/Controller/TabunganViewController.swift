//
//  TabunganViewController.swift
//  Mandiri
//
//  Created by user on 21/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class TabunganViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

//    @IBAction func indexTesx(_ sender: Any) {
//        switch segmentedControl.selectedSegmentIndex
//        {
//        case 0:
//            testtes.text = "First Segment Selected"
//        case 1:
//            testtes.text = "Second Segment Selected"
//        default:
//            break
//        }
//    }
    
    @IBAction func investYuk(_ sender: Any) {
        FormInvestasiViewController.navigateToModule(self)
    }
    
    @IBAction func settingsAction(_ sender: Any) {
        PengaturanViewController.navigateToModule(self)
    }
    
}
