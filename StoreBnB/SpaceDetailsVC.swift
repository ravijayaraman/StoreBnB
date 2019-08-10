//
//  LoginVC.swift
//  StoreBnB
//
//  Created by Tonatiuh C on 10/8/19.
//  Copyright © 2019 Ravi Jayaraman. All rights reserved.
//

import UIKit

class SpaceDetailsVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var btnBookSpace: CustomButtons!
    @IBOutlet weak var imgSpaceView: UIImageView!
    
    var strTitle: String?
    var strSubTitle: String?
    var strLocation: String?
    var strDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Call the function to setup the UI when the view loads
        setupUI()
    }
    
    // This function is used to setup the view
    func setupUI() {
        self.view.appThemeColor(.skyBlue)
        imgSpaceView.applyBorder(.round)
        btnBookSpace.buttonConfig(.submit)
        setupLabels()
        self.title = "Details"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    func setupLabels() {
        lblTitle.text = strTitle ?? ""
        lblLocation.text = strLocation ?? ""
        lblSubTitle.text = strSubTitle ?? ""
        lblDescription.text = "Ideal for people looking for an affordable office store space. Easy access from Sydney Central and from Harbour. Offer price can discounted based on the number of days you book the space."//strDescription ?? ""
    }
    
    @IBAction func btnBookNowTapped(_ sender: Any) {
        let sbMain = UIStoryboard(name: "Main", bundle: nil)
        let vcBookingDetails = sbMain.instantiateViewController(withIdentifier: "BookingSuccessVC") as! BookingSuccessVC
        self.navigationController?.pushViewController(vcBookingDetails, animated: true)
    }
}
