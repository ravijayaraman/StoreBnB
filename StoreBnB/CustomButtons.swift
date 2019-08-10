//
//  CustomButtons.swift
//  StoreBnB
//
//  Created by Tonatiuh C on 11/8/19.
//  Copyright © 2019 Ravi Jayaraman. All rights reserved.
//

import UIKit

enum buttonType {
    case normal
    case submit
}

class CustomButtons: UIButton {

    func buttonConfig(_ configFor: buttonType) {
        switch configFor {
        case .submit:
            self.backgroundColor = ThemeColors.shared.themeDarkNavyBlue()
            self.setTitleColor(ThemeColors.shared.themeGray(), for: .normal)
        default:
            self.backgroundColor = .clear
            self.setTitleColor(ThemeColors.shared.themeDarkNavyBlue(), for: .normal)
        }
        
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
}
