//
//  BookingSuccessVC.swift
//  StoreBnB
//
//  Created by Tonatiuh C on 11/8/19.
//  Copyright © 2019 Ravi Jayaraman. All rights reserved.
//

import UIKit

class BookingSuccessVC: UIViewController {

    @IBOutlet weak var lblBooked: UILabel!
    
    @IBOutlet weak var lblSpare: UILabel!
    @IBOutlet weak var imgViwEmptyBox: UIImageView!
    @IBOutlet weak var imgViwSuccessThumb: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetup()
        self.view.appThemeColor(.skyBlue)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startAnimations()
    }
    
    func initialSetup() {
        imgViwEmptyBox.alpha = 0
        imgViwSuccessThumb.alpha = 0
        lblBooked.alpha = 0
    }
    
    func startAnimations() {
        UIView.animate(withDuration: 2.0, animations: {
            self.lblSpare.alpha = 0.2
            self.imgViwEmptyBox.alpha = 0.2
        }) { (_) in
            UIView.animate(withDuration: 1.0, animations: {
                self.imgViwEmptyBox.alpha = 1
                self.lblSpare.alpha = 0
                self.lblBooked.alpha = 0.3
            }, completion: { (_) in
                UIView.animate(withDuration: 1.6, animations: {
                    self.lblBooked.alpha = 1
                }, completion: { (_) in
                    UIView.animate(withDuration: 0.7, animations: {
                        self.lblBooked.alpha = 0.5
                    }, completion: { (_) in
                        UIView.animate(withDuration: 0.7, animations: {
                            self.lblBooked.alpha = 0
                            self.imgViwSuccessThumb.alpha = 1
                        }, completion: { (_) in
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                guard let viewControllers = self.navigationController?.viewControllers else { return }
                                for vc in viewControllers {
                                    if let viwController = vc as? DashboardVC {
                                        self.navigationController?.popToViewController(viwController, animated: true)
                                    }
                                }
                            })
                        })
                    })
                })
            })
        }
    }
}
