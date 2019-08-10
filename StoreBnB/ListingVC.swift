//
//  ListingVC.swift
//  StoreBnB
//
//  Created by Tonatiuh C on 10/8/19.
//  Copyright © 2019 Ravi Jayaraman. All rights reserved.
//

import UIKit

class ListingVC: UIViewController {

    @IBOutlet weak var imgLuggage: UIImageView!
    @IBOutlet weak var imgBox: UIImageView!
    @IBOutlet weak var imgTruck: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblMinPrice: UILabel!
    @IBOutlet weak var lblMaxPrice: UILabel!
    @IBOutlet weak var sliderPrice: UISlider!
    @IBOutlet weak var btnListItNow: CustomButtons!
    @IBOutlet weak var btnAddPhotos: CustomButtons!
    @IBOutlet weak var viwPhotos: UIView!
    
    let imageBoxBW = UIImage(named: "Box_BW")?.withAlignmentRectInsets(UIEdgeInsets(top: -20, left: 0, bottom: -20, right: 0))
    let imageBoxColor = UIImage(named: "Box_Color")?.withAlignmentRectInsets(UIEdgeInsets(top: -20, left: 0, bottom: -20, right: 0))
    let imageTruckBW = UIImage(named: "Truck_BW")?.withAlignmentRectInsets(UIEdgeInsets(top: -20, left: 0, bottom: -20, right: 0))
    let imageTruckColor = UIImage(named: "Truck_Color")?.withAlignmentRectInsets(UIEdgeInsets(top: -20, left: 0, bottom: -20, right: 0))
    let imageLuggageBW = UIImage(named: "Luggage_BW")?.withAlignmentRectInsets(UIEdgeInsets(top: -20, left: 0, bottom: -20, right: 0))
    let imageLuggageColor = UIImage(named: "Luggage_Color")?.withAlignmentRectInsets(UIEdgeInsets(top: -20, left: 0, bottom: -20, right: 0))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupUI()
        let dismissGesture = UITapGestureRecognizer(target: self, action: #selector(dismissGesture(_:)))
        self.view.addGestureRecognizer(dismissGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.title = "List Your Spare Space"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    func setupUI() {
        setupImages()
        setupButton()
        viwPhotos.isHidden = true
        self.view.appThemeColor(.skyBlue)
        sliderPrice.addTarget(self, action: #selector(sliderMove(_:)), for: .valueChanged)
    }
    
    func setupButton() {
        btnAddPhotos.addTarget(self, action: #selector(btnAddPhotos(_:)), for: .touchUpInside)
        btnListItNow.addTarget(self, action: #selector(btnListItNowTapped(_:)), for: .touchUpInside)
        btnAddPhotos.buttonConfig(.normal)
        btnListItNow.buttonConfig(.submit)
    }
    
    func setupImages() {
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        imgTruck.highlightedImage = imageTruckColor
        imgTruck.image = imageTruckBW
        imgTruck.tag = 102
        imgTruck.addGestureRecognizer(tapGesture1)
        imgTruck.isUserInteractionEnabled = true
        
        imgBox.highlightedImage = imageBoxColor
        imgBox.image = imageBoxBW
        imgBox.tag = 101
        imgBox.addGestureRecognizer(tapGesture2)
        imgBox.isUserInteractionEnabled = true
        
        imgLuggage.highlightedImage = imageLuggageColor
        imgLuggage.image = imageLuggageBW
        imgLuggage.tag = 100
        imgLuggage.addGestureRecognizer(tapGesture3)
        imgLuggage.isUserInteractionEnabled = true
        
        highlightLuggage()
        
        lblMinPrice.text = "Min"
        lblMaxPrice.text = "Max"
    }
    
    func setupCurrentSelected(_ imageView: UIImageView) {
        
        if imageView == imgBox {
            highlightBox()
        }
        else if imageView == imgTruck {
            highlightTruck()
        }
        else {
            highlightLuggage()
        }
    }
    
    func highlightLuggage() {
        imgLuggage.isHighlighted = true
        imgBox.isHighlighted = false
        imgTruck.isHighlighted = false
        sliderPrice.minimumValue = 2.0
        sliderPrice.maximumValue = 10.0
        sliderPrice.setValue(sliderPrice.minimumValue, animated: true)
        lblPrice.text = "$\(Int(sliderPrice.minimumValue))"
        self.view.endEditing(true)
    }
    
    func highlightBox() {
        imgBox.isHighlighted = true
        imgLuggage.isHighlighted = false
        imgTruck.isHighlighted = false
        sliderPrice.minimumValue = 5.0
        sliderPrice.maximumValue = 15.0
        sliderPrice.setValue(sliderPrice.minimumValue, animated: true)
        lblPrice.text = "$\(Int(sliderPrice.minimumValue))"
        self.view.endEditing(true)
    }
    
    func highlightTruck() {
        imgTruck.isHighlighted = true
        imgBox.isHighlighted = false
        imgLuggage.isHighlighted = false
        sliderPrice.minimumValue = 10.0
        sliderPrice.maximumValue = 25.0
        sliderPrice.setValue(sliderPrice.minimumValue, animated: true)
        lblPrice.text = "$\(Int(sliderPrice.minimumValue))"
        self.view.endEditing(true)
    }
    
    @IBAction func btnAddPhotos(_ sender: UIButton) {
        viwPhotos.isHidden = false
        btnAddPhotos.isHidden = true
    }
    
    @IBAction func btnListItNowTapped(_ sender: UIButton) {
        let sbMain = UIStoryboard(name: "Main", bundle: nil)
        let vcDashboard = sbMain.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        vcDashboard.isFromNewListing = true
        self.navigationController?.pushViewController(vcDashboard, animated: true)
    }
    
    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        guard let tag = sender.view?.tag else { return }
        
        if tag == 100 {
            highlightLuggage()
        }
        else if tag == 101 {
            highlightBox()
        }
        else if tag == 102 {
            highlightTruck()
        }
    }
    
    @IBAction func sliderMove(_ sender: Any) {
        lblPrice.text = "$\(Int(sliderPrice.value))"
    }
    
    @IBAction func dismissGesture(_ sender: Any) {
        self.view.endEditing(true)
    }
}

extension ListingVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.endEditing(true)
    }
}
