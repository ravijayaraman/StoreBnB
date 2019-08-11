//
//  BookingSuccessVC.swift
//  StoreBnB
//
//  Created by Tonatiuh C on 11/8/19.
//  Copyright © 2019 Ravi Jayaraman. All rights reserved.
//

import UIKit

//This class is used to show the booking confirmation view contoller
class BookingSuccessVC: UIViewController {

    //MARK: - Outlets required in this view controller
    @IBOutlet weak var lblBooked: UILabel!
    @IBOutlet weak var lblSpare: UILabel!
    @IBOutlet weak var imgViwEmptyBox: UIImageView!
    @IBOutlet weak var imgViwSuccessThumb: UIImageView!
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetup()
        self.view.appThemeColor(.skyBlue)
        self.title = ScreenTitle.Confirmed.rawValue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startAnimations()
    }
    
    //MARK: - Custom functions
    
    //Initial setup and for the view controller
    func initialSetup() {
        imgViwEmptyBox.alpha = 0
        imgViwSuccessThumb.alpha = 0
        lblBooked.alpha = 0
    }
    
    //This function is used to perform all the animationson this page when the booking is confirmed
    func startAnimations() {
        UIView.animate(withDuration: 0.8, animations: {
            self.lblSpare.alpha = 0.2
            self.imgViwEmptyBox.alpha = 0.2
        }) { (_) in
            UIView.animate(withDuration: 1.0, animations: {
                self.imgViwEmptyBox.alpha = 1
                self.lblSpare.alpha = 0
                self.lblBooked.alpha = 0.3
            }, completion: { (_) in
                UIView.animate(withDuration: 1.2, animations: {
                    self.lblBooked.alpha = 1
                }, completion: { (_) in
                    UIView.animate(withDuration: 0.7, animations: {
                        self.lblBooked.alpha = 0
                    }, completion: { (_) in
                        UIView.animate(withDuration: 0.6, animations: {
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
