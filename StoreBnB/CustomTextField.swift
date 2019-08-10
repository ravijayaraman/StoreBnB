//
//  CustomTextField.swift
//  StoreBnB
//
//  Created by Tonatiuh C on 11/8/19.
//  Copyright © 2019 Ravi Jayaraman. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.font = UIFont.systemFont(ofSize: 17)
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: ThemeColors.shared.themeDarkNavyBlue()])
        self.layer.borderColor = ThemeColors.shared.themeDarkNavyBlue().cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.borderStyle = .none
        self.layer.masksToBounds = true
    }
}
