//
//  ListingTBC.swift
//  StoreBnB
//
//  Created by Tonatiuh C on 11/8/19.
//  Copyright © 2019 Ravi Jayaraman. All rights reserved.
//

import UIKit

class ListingTBC: UICollectionViewCell {

    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var imgViwIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        self.applyBorder(.round)
    }
    
    func setupCell() {
        imgViwIcon.applyBorder(.circle)
    }
}
