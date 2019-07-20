//
//  OnboardCollectionViewCell.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit
protocol OnBoardingProtocol {
    func activateClick()
    func signInClick()
}
class OnboardCollectionViewCell: UICollectionViewCell {
    var delegate: OnBoardingProtocol?
    @IBOutlet weak var activateButton: UIButton!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var imageTitle: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    
    func setupContent(viewModel: OnBoardingModel.viewModel, id: Int) {
        if id == 2 {
            activateButton.isHidden = false
            signinButton.isHidden = false
        }else{
            activateButton.isHidden = true
            signinButton.isHidden = true
        }
        self.imageTitle.image = UIImage(named: viewModel.image)
        self.titleText.text = viewModel.title
        self.descriptionText.text = viewModel.description
    }
    
    
    @IBAction func signInAction(_ sender: Any) {
        self.delegate?.signInClick()
    }
    
    @IBAction func activateAction(_ sender: Any) {
        self.delegate?.activateClick()
    }
    
}
