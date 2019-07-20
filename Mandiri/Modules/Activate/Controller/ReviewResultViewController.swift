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
        
        setupView()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismissPage()
    }
    
    func setupView(){
        guard let ktp = Preference.getObject(key: BasePrefKey.KTPIMAGE) as? UIImage else { return }
        guard let selfie = Preference.getObject(key: BasePrefKey.SELFIEIMAGE) as? UIImage else { return }
        self.PreviewKtp.image = ktp.cropToBounds(width: 200, height: 200)
        self.PreviewKtp.contentMode = .scaleAspectFill
        
        self.previewSelfie.image = selfie.cropToBounds(width: 200, height: 200)
        self.previewSelfie.contentMode = .scaleAspectFill
    
    }

   
    @IBAction func sendPhotoAction(_ sender: Any) {
        PopupSignInViewController.navigateToModule(self)
    }
    
    
    @IBAction func retryPhoto(_ sender: Any) {
        self.dismissPage()
    }
}



extension ReviewResultViewController {
    static func navigateToModule(_ caller: UIViewController) {
        let sb = UIStoryboard(name:"Activate",bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ReviewResultViewController") as! ReviewResultViewController
        caller.presentDetail(vc)
    }
    
}
