//
//  Colors.swift
//  StoreBnB
//
//  Created by Tonatiuh C on 10/8/19.
//  Copyright © 2019 Ravi Jayaraman. All rights reserved.
//

import UIKit

enum themeColor {
    case gray
    case skyBlue
    case blue
    case darkNavyBlue
}

enum cornerType {
    case round
    case circle
    case none
}

extension UIView {
    
    func appThemeColor(_ themeColor: themeColor) {
        switch themeColor {
        case .gray:
            self.backgroundColor = ThemeColors.shared.themeGray()
        case .blue:
            self.backgroundColor = ThemeColors.shared.themeBlue()
        case .skyBlue:
            self.backgroundColor = ThemeColors.shared.themeSkyBlue()
        case .darkNavyBlue:
            self.backgroundColor = ThemeColors.shared.themeDarkNavyBlue()
        }
    }
    
    func applyBorder(_ cornerType: cornerType) {
        
        switch cornerType {
        case .circle:
            self.layer.cornerRadius = self.frame.height / 2
            self.layer.masksToBounds = true
        case .round:
            self.layer.cornerRadius = self.frame.height / 5
            self.layer.masksToBounds = true
        default:
            break
        }
    }
}

struct ThemeColors {
    
    static let shared = ThemeColors()
    
    func themeGray() -> UIColor {
        return UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
    }
    
    func themeBlue() -> UIColor {
        return UIColor(red: 0/255, green: 119/255, blue: 192/255, alpha: 1)
    }
    
    func themeSkyBlue() -> UIColor {
        return UIColor(red: 199/255, green: 238/255, blue: 255/255, alpha: 1)
    }
    
    func themeDarkNavyBlue() -> UIColor {
        return UIColor(red: 29/255, green: 36/255, blue: 43/255, alpha: 1)
    }
}

extension UIViewController {
    
    func getImageFromAsset(_ imageName: String) -> UIImage {
        return UIImage(named: imageName) ?? UIImage()
    }
}
