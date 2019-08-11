//
//  MyListingVC.swift
//  StoreBnB
//
//  Created by Tonatiuh C on 11/8/19.
//  Copyright © 2019 Ravi Jayaraman. All rights reserved.
//

import UIKit


class MyListingVC: UIViewController {

    @IBOutlet weak var colViwMyListing: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        colViwMyListing.delegate = self
        colViwMyListing.dataSource = self
        self.view.appThemeColor(.skyBlue)
        colViwMyListing.backgroundColor = .clear
        colViwMyListing.register(UINib(nibName: ViewControllers.shared.ListingTBC, bundle: nil), forCellWithReuseIdentifier: ViewControllers.shared.ListingTBC)
        
        self.title = ScreenTitle.MyListing.rawValue
    }
}

extension MyListingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListingTBC", for: indexPath) as! ListingTBC
        
        if indexPath.row == 0 {
            cell.lblPrice.text = "Booking confirmed for John Doe\n26/08/2019\n$4 per day"
            let imageThumb = UIImage(named: "Accept")?.withAlignmentRectInsets(UIEdgeInsets(top: -20, left: 0, bottom: -20, right: 0))
            cell.imgViwIcon.image = imageThumb
        }
        else if indexPath.row == 1 {
            cell.lblPrice.text = "Yet to be confirmed for Batman\n28/08/2019\n$7 per day"
            let imageThumb = UIImage(named: "Accept_BW")?.withAlignmentRectInsets(UIEdgeInsets(top: -20, left: 0, bottom: -20, right: 0))
            cell.imgViwIcon.image = imageThumb
        }
        else if indexPath.row == 2 {
            cell.lblPrice.text = "Yet to be confirmed for Batman\n28/08/2019\n$7 per day"
            let imageThumb = UIImage(named: "Accept_BW")?.withAlignmentRectInsets(UIEdgeInsets(top: -20, left: 0, bottom: -20, right: 0))
            cell.imgViwIcon.image = imageThumb
        }
        else {
            cell.lblPrice.text = "Booking confirmed for John Doe\n26/08/2019\n$4 per day"
            let imageThumb = UIImage(named: "Accept")?.withAlignmentRectInsets(UIEdgeInsets(top: -20, left: 0, bottom: -20, right: 0))
            cell.imgViwIcon.image = imageThumb
        }
        
        cell.backgroundColor = ThemeColors.shared.themeGray()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 25, height: 70)
    }
}
