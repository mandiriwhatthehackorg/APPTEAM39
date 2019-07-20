//
//  OnboardingViewController.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    var timer: Timer?
    var viewModel: [OnBoardingModel.viewModel] = [OnBoardingModel.viewModel(image: "icon_saving", title: "Saving", description: "Kamu bisa simpan uang dari tiap transaksi sebagai tabungan loh!"), OnBoardingModel.viewModel(image: "icon_investment", title: "Invest", description: "Dan bisa dipergunakan untuk investasi juga, tinggal pilih level risknya aja!"), OnBoardingModel.viewModel(image: "icon_join", title: "Join Now!", description: "Pengen langsung ngerasain aplikasinya? Gabung sekarang yuk!")]
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerDataSource()

        // Do any additional setup after loading the view.
    }
    
    func registerDataSource()  {
        self.pageControl.currentPage = 0
        self.pageControl.numberOfPages = self.viewModel.count
        collection.register(UINib(nibName: IdentifierCell.onboardingView, bundle: nil), forCellWithReuseIdentifier:  IdentifierCell.onboardingView)
    }

}

extension OnboardingViewController: UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  IdentifierCell.onboardingView, for: indexPath) as! OnboardCollectionViewCell
        cell.setupContent(viewModel: self.viewModel[indexPath.row], id: indexPath.row)
        cell.delegate = self
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow :CGFloat = 1
        let height : CGFloat = collectionView.frame.height
        let width = collectionView.frame.width / itemsPerRow
        let size = CGSize(width: width, height: height)
        return size
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage:CGFloat = round(scrollView.contentOffset.x / scrollView.frame.width)
        self.pageControl.currentPage = Int(currentPage);
        
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let currentPage:CGFloat = round(scrollView.contentOffset.x / scrollView.frame.width)
        self.pageControl.currentPage = Int(currentPage);
    }
    
    @objc func handlePress(_ sender: UILongPressGestureRecognizer){
        if sender.state == .began {
            self.timer?.invalidate()
            self.timer = nil
        }
        
        if sender.state == .ended {
            self.timer = Timer.scheduledTimer(timeInterval: 8, target: self, selector: #selector(autoScrollImageSlider), userInfo: nil, repeats: true)
        }
    }
    
    @objc func autoScrollImageSlider() {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                let firstIndex = 0
                let lastIndex = self.viewModel.count - 1
                let visibleIndices = self.collection.indexPathsForVisibleItems
                let nextIndex = visibleIndices[0].row + 1
                let nextIndexPath: IndexPath = IndexPath.init(item: nextIndex, section: 0)
                let firstIndexPath: IndexPath = IndexPath.init(item: firstIndex, section: 0)
                if nextIndex > lastIndex {
                    self.collection.scrollToItem(at: firstIndexPath, at: .centeredHorizontally, animated: true)
                } else {
                    self.collection.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
                }
            }
        }
    }
}

extension OnboardingViewController: OnBoardingProtocol {
    func activateClick() {
        ActivateViewController.navigateToModule(self)
    }
    
    func signInClick() {
        SignInViewController.navigateToModule(self)
    }
    
    
}


extension OnboardingViewController {
     static func navigateToModule(_ caller: UIViewController) {
         let sb = UIStoryboard(name:"Onboarding",bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "OnboardingViewController") as! OnboardingViewController
        caller.present(vc, animated: false, completion: nil)
        
    }
}
