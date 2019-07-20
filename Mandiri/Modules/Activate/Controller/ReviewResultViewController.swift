//
//  ReviewResultViewController.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit

class ReviewResultViewController: UIViewController {

    @IBOutlet weak var previewSelfie: UIImageView!
    @IBOutlet weak var PreviewKtp: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismissPage()
    }
    
    func setupView(){
        guard let ktp = Preference.getObject(key: BasePrefKey.KTPIMAGE) as? UIImage else { return }
        guard let selfie = Preference.getObject(key: BasePrefKey.SELFIEIMAGE) as? UIImage else { return }
        
        
    }

   
    @IBAction func sendPhotoAction(_ sender: Any) {
    }
    
    
    @IBAction func retryPhoto(_ sender: Any) {
        self.dismissPage()
    }
}
