//
//  HomeViewController.swift
//  Mandiri
//
//  Created by user on 20/07/19.
//  Copyright © 2019 Tunaiku. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var howCollection: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var carColection: UICollectionView!
    var dataHow: [String] = ["Gini Loh Caranya Saving", "Gampang, Investasi aja", "Juga bisa withdrawal loh"]
    override func viewDidLoad() {
        super.viewDidLoad()
        registerDataSource()
        // Do any additional setup after loading the view.
    }
    
    func registerDataSource()  {
        self.pageControl.currentPage = 0
        self.pageControl.numberOfPages = 2
        carColection.register(UINib(nibName: IdentifierCell.cardCollection, bundle: nil), forCellWithReuseIdentifier:  IdentifierCell.cardCollection)
        howCollection.register(UINib(nibName: IdentifierCell.HowCollection, bundle: nil), forCellWithReuseIdentifier:  IdentifierCell.HowCollection)
        carColection.register(UINib(nibName: IdentifierCell.plusCollection, bundle: nil), forCellWithReuseIdentifier:  IdentifierCell.plusCollection)

    }
}


extension HomeViewController: UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.carColection {
            return 2
        }else{
            return self.dataHow.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.carColection {
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  IdentifierCell.cardCollection, for: indexPath) as! cardCollectionViewCell
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  IdentifierCell.plusCollection, for: indexPath) as! PlusCollectionViewCell
                return cell
            }
           
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  IdentifierCell.HowCollection, for: indexPath) as! HowCollectionViewCell
            return cell
        }
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.carColection {
            let itemsPerRow :CGFloat = 1
            let height : CGFloat = collectionView.frame.height
            let width = collectionView.frame.width / itemsPerRow
            let size = CGSize(width: width, height: height)
            return size
        }else{
            let itemsPerRow :CGFloat = 3
            let height : CGFloat = collectionView.frame.height
            let width = collectionView.frame.width / itemsPerRow
            let size = CGSize(width: width, height: height)
            return size
        }
     
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage:CGFloat = round(scrollView.contentOffset.x / scrollView.frame.width)
        self.pageControl.currentPage = Int(currentPage);
        
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let currentPage:CGFloat = round(scrollView.contentOffset.x / scrollView.frame.width)
        self.pageControl.currentPage = Int(currentPage);
    }
}
