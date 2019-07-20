//
//  ResultSelfieViewController.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit

class ResultSelfieViewController: UIViewController {
    @IBOutlet weak var ktpPreview: UIImageView!
    var selfieImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setKtpPreview()
    }
    
    @IBAction func takePhotoAgain(_ sender: Any) {
        self.dismissPage()
    }
    
    @IBAction func ReviewPhoto(_ sender: Any) {
        //SelfieViewController.navigateToModule(self)
    }
    
    
    
    @IBAction func backPage(_ sender: Any) {
        self.dismissPage()
    }
    
    func setKtpPreview(){
        guard let image = selfieImage else { return }
        
        Preference.saveObject(key: BasePrefKey.SELFIEIMAGE, value: image)
        self.ktpPreview.image = image.cropToBounds(width: 200, height: 200)
        self.ktpPreview.contentMode = .scaleAspectFill
    }
    
}


extension ResultSelfieViewController {
    static func navigateToModule(_ caller: UIViewController, selfieImage: UIImage) {
        let sb = UIStoryboard(name:"Activate",bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ResultSelfieViewController") as! ResultSelfieViewController
        vc.selfieImage = selfieImage
        caller.presentDetail(vc)
    }

}
