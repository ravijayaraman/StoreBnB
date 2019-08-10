//
//  ViewController.swift
//  StoreBnB
//
//  Created by Tonatiuh C on 10/8/19.
//  Copyright © 2019 Ravi Jayaraman. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
    
    @IBOutlet weak var imgWelcomeLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 3, animations: {
                
            }, completion: { (success) in
                let sbMain = UIStoryboard(name: "Main", bundle: nil)
                let vcDashboard = sbMain.instantiateViewController(withIdentifier: "LandingVC") as! LandingVC
                self.navigationController?.pushViewController(vcDashboard, animated: true)
            })
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    //This function is used to setup the UI
    func setupUI() {
        setupLogo()
        self.view.appThemeColor(.skyBlue)
    }
    
    func setupLogo() {
        imgWelcomeLogo.animationImages = [getImageFromAsset(Images.shared.campingTent).withAlignmentRectInsets(UIEdgeInsets(top: -40, left: 0, bottom: -40, right: 0)),getImageFromAsset(Images.shared.carLuggage).withAlignmentRectInsets(UIEdgeInsets(top: -40, left: 0, bottom: -40, right: 0)),getImageFromAsset(Images.shared.luggage).withAlignmentRectInsets(UIEdgeInsets(top: -40, left: 0, bottom: -40, right: 0)),getImageFromAsset(Images.shared.scuba).withAlignmentRectInsets(UIEdgeInsets(top: -40, left: 0, bottom: -40, right: 0))]
        imgWelcomeLogo.animationDuration = 3
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.imgWelcomeLogo.startAnimating()
        }
    }
}

