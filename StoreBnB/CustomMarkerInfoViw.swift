//
//  CustomMarkerInfoViw.swift
//  StoreBnB
//
//  Created by Tonatiuh C on 10/8/19.
//  Copyright © 2019 Ravi Jayaraman. All rights reserved.
//

import UIKit

class CustomMarkerInfoViw: UIView {

    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnSpaceDetails: UIButton!
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.appThemeColor(.gray)
    }
    
}
