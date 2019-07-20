//
//  ResultKTPViewController.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit

class ResultKTPViewController: UIViewController {

    @IBOutlet weak var ktpPreview: UIImageView!
    var ktpImage: UIImage?
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
    
    @IBAction func takeSelfiePhoto(_ sender: Any) {
        
    }
    
    
    
    @IBAction func backPage(_ sender: Any) {
        self.dismissPage()
    }
    
    func setKtpPreview(){
        guard let image = ktpImage else { return }
        self.ktpPreview.image = image.cropToBounds(width: 200, height: 200)
        self.ktpPreview.contentMode = .scaleAspectFill
    }
    
}


extension ResultKTPViewController {
    static func navigateToModule(_ caller: UIViewController, ktpImage: UIImage) {
        let sb = UIStoryboard(name:"Activate",bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ResultKTPViewController") as! ResultKTPViewController
        vc.ktpImage = ktpImage
        caller.presentDetail(vc)
    }
}
