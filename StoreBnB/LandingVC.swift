//
//  LandingVC.swift
//  StoreBnB
//
//  Created by Tonatiuh C on 10/8/19.
//  Copyright © 2019 Ravi Jayaraman. All rights reserved.
//

import UIKit

class LandingVC: UIViewController {

    @IBOutlet weak var btnVendor: UIButton!
    @IBOutlet weak var btnCustomer: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        navigationController?.navigationBar.tintColor = ThemeColors.shared.themeDarkNavyBlue()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationItem.title = " "
    }
    
    func setupUI() {
        setupButtons()
    }
    
    func setupButtons() {
        btnVendor.applyBorder(.round)
        btnVendor.appThemeColor(.gray)
        btnVendor.setTitle("I HAVE SPARE SPACE\nI WANT TO RENT OUT.", for: .normal)
        btnVendor.layer.borderWidth = 6
        btnVendor.layer.borderColor = ThemeColors.shared.themeDarkNavyBlue().cgColor
        btnVendor.setTitleColor(ThemeColors.shared.themeDarkNavyBlue(), for: .normal)
        btnVendor.addTarget(self, action: #selector(btnVendorTapped(_:)), for: .touchUpInside)
        
        btnCustomer.applyBorder(.round)
        btnCustomer.appThemeColor(.gray)
        btnCustomer.setTitle("I´M LOOKING FOR SPARE SPACE.", for: .normal)
        btnCustomer.layer.borderWidth = 6
        btnCustomer.layer.borderColor = ThemeColors.shared.themeDarkNavyBlue().cgColor
        btnCustomer.setTitleColor(ThemeColors.shared.themeDarkNavyBlue(), for: .normal)
        btnCustomer.addTarget(self, action: #selector(btnCustomerTapped(_:)), for: .touchUpInside)
        
        self.view.appThemeColor(.skyBlue)
    }
    
    @IBAction func btnCustomerTapped(_ sender: UIButton) {
        let sbMain = UIStoryboard(name: "Main", bundle: nil)
        let vcDashboard = sbMain.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        self.navigationController?.pushViewController(vcDashboard, animated: true)
    }
    
    @IBAction func btnVendorTapped(_ sender: UIButton) {
        let sbMain = UIStoryboard(name: "Main", bundle: nil)
        let vcDashboard = sbMain.instantiateViewController(withIdentifier: "ListingVC") as! ListingVC
        self.navigationController?.pushViewController(vcDashboard, animated: true)
    }
}
