//
//  ActivateViewController.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit
import Photos
class ActivateViewController: UIViewController {
    let cameraController = CameraController()
    @IBOutlet weak var previewPhoto: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Preference.saveBool(key: BasePrefKey.ISBACKCAMERA, value: true)
        configureCameraController()
        // Do any additional setup after loading the view.
    }
    
    func configureCameraController() {
        cameraController.prepare {(error) in
            if let error = error {
                print(error)
            }
            
            try? self.cameraController.displayPreview(on: self.previewPhoto)
        }
    }
    
    
    @IBAction func backPage(_ sender: Any) {
        self.dismissPage()
    }
    

    @IBAction func takePicture(_ sender: Any) {
        cameraController.captureImage {(image, error) in
            guard let image = image else {
                
                print(error ?? "Image capture error")
                return
            }
            
            print("test \(image)")
            ResultKTPViewController.navigateToModule(self, ktpImage: image)
            //MARK: DO SOMETHING
            //self.presenter?.navigateToPhotoConfirmation(self, flag: "SELFIE", image: image)
        }
    }
}


extension ActivateViewController {
    static func navigateToModule(_ caller: UIViewController) {
        let sb = UIStoryboard(name:"Activate",bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ActivateViewController") as! ActivateViewController
        caller.presentDetail(vc)
    }
}
