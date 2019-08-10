//
//  DashboardVC.swift
//  StoreBnB
//
//  Created by Tonatiuh C on 10/8/19.
//  Copyright © 2019 Ravi Jayaraman. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class DashboardVC: UIViewController {

    lazy var searchBar:UISearchBar = UISearchBar()
    var isFromNewListing = false
    var colViwListingAds: UICollectionView!
    
    var arrListStorage: [String]?
    var arrLocations = [GMSMarker]()
    var arrLocationsMel = [GMSMarker]()
    var mapView = GMSMapView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        checkForNewPost()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    func checkForNewPost() {
        if isFromNewListing {
            UIView.animate(withDuration: 1.5, animations: {
                self.colViwListingAds.alpha = 1
            }) { (success) in
                if success {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
                        UIView.animate(withDuration: 1) {
                            self.colViwListingAds.alpha = 0
                        }
                    })
                }
            }
        }
    }
    
    func setupUI() {
        
        setupTable()
        setupMapView()
        setupSearchBar()
    }
    
    func setupTable() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 20
        let frame = CGRect(x: self.view.frame.minX + 20, y: self.view.frame.height - (20 + (self.view.frame.width - 40 * 0.22)), width: self.view.frame.width - 40, height: (self.view.frame.width - 40) * 0.24)
        flowLayout.itemSize = frame.size
        flowLayout.scrollDirection = .horizontal
        colViwListingAds = UICollectionView(frame: frame, collectionViewLayout: flowLayout)
        colViwListingAds.delegate = self
        colViwListingAds.dataSource = self
        colViwListingAds.alpha = 0
        colViwListingAds.backgroundColor = .clear
        colViwListingAds.register(UINib(nibName: "ListingTBC", bundle: nil), forCellWithReuseIdentifier: "ListingTBC")
    }
    
    func setupMapView() {
        // Do any additional setup after loading the view.
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        let markerImage = getImageFromAsset(Images.shared.mapMarker)
        let markerView = UIImageView(image: markerImage)
        marker.iconView = markerView
        marker.map = mapView
        mapView.delegate = self
        mapView.addSubview(searchBar)
        mapView.addSubview(colViwListingAds)
        colViwListingAds.center.y = UIScreen.main.bounds.height - colViwListingAds.frame.height
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker1.iconView = markerView
        marker1.map = mapView
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: -30.76, longitude: 151.30)
        marker2.iconView = markerView
        marker2.map = mapView
        
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: -36.96, longitude: 149.29)
        marker3.iconView = markerView
        marker3.map = mapView
        
        arrLocations.append(marker1)
        arrLocations.append(marker2)
        arrLocations.append(marker3)
        
        let marker4 = GMSMarker()
        marker4.position = CLLocationCoordinate2D(latitude: -38.614, longitude: 144.99352)
        marker4.iconView = markerView
        marker4.map = mapView
        
        let marker5 = GMSMarker()
        marker5.position = CLLocationCoordinate2D(latitude: -37.814, longitude: 144.97382)
        marker5.iconView = markerView
        marker5.map = mapView
        
        let marker6 = GMSMarker()
        marker6.position = CLLocationCoordinate2D(latitude: -43.844, longitude: 144.95338)
        marker6.iconView = markerView
        marker6.map = mapView
        
        arrLocationsMel.append(marker4)
        arrLocationsMel.append(marker5)
        arrLocationsMel.append(marker6)
    }
    
    func setupSearchBar() {
        
        searchBar.searchBarStyle = .prominent
        searchBar.placeholder = " Search space"
        searchBar.sizeToFit()
        searchBar.isTranslucent = true
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "My List", style: .plain, target: self, action: #selector(btnBarMyListTapped(_:)))
    }
    
    @IBAction func btnBarMyListTapped(_ sender: Any) {
        let sbMain = UIStoryboard(name: "Main", bundle: nil)
        let vcSpaceDetails = sbMain.instantiateViewController(withIdentifier: "MyListingVC") as! MyListingVC
        self.navigationController?.pushViewController(vcSpaceDetails, animated: true)
    }
}

extension DashboardVC: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView? {
        
        if let infoView = Bundle.main.loadNibNamed("CustomMarkerInfoViw", owner: self, options: nil)?[0] as? CustomMarkerInfoViw {
            infoView.lblLocation.text = "Bondi Beach house"
            infoView.lblPrice.text = "$10 / day"
            infoView.lblSize.text = "Ideal for travel luggage"
            infoView.translatesAutoresizingMaskIntoConstraints = false
            
            return infoView
        } else {
            return nil
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        let sbMain = UIStoryboard(name: "Main", bundle: nil)
        let vcSpaceDetails = sbMain.instantiateViewController(withIdentifier: ViewControllers.shared.SpaceDetailsVC) as! SpaceDetailsVC
       
        vcSpaceDetails.strTitle = "Bondi Beach house"
        vcSpaceDetails.strSubTitle = "$10 / day"
        vcSpaceDetails.strDescription = "Ideal for travel luggage"
        vcSpaceDetails.strLocation = "Bondi NSW"
    
        self.navigationController?.pushViewController(vcSpaceDetails, animated: true)
    }
}

extension DashboardVC: UISearchBarDelegate {
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isFromNewListing = false
        searchBar.endEditing(true)
        //Code the table view loading once the content is done
        guard let strSearchText = searchBar.text else { return }
        if strSearchText.lowercased() == "melbourne" {
            arrListStorage = ["Spider Man\n$2 per day\nMy web storage at Bondi","Super Man\n$7 per day\nClark´s Desk up for lease at CBD","Bat Man\n$15 per day\nAt Batcave with bat rangs and bat snacks"]
            colViwListingAds.reloadData()
            colViwListingAds.alpha = 1
        }
        else if strSearchText.lowercased() == "sydney" {
            arrListStorage = ["Spider Man\n$2 per day\nMy web storage at Bondi","Super Man\n$7 per day\nClark´s Desk up for lease at CBD","Bat Man\n$15 per day\nAt Batcave with bat rangs and bat snacks"]
            colViwListingAds.reloadData()
            colViwListingAds.alpha = 1
        }
        else {
            let alert = UIAlertController(title: "Oops!", message: "No storage available at this location", preferredStyle: .alert)
            let actionOkay = UIAlertAction(title: "OK", style: .default) { (_) in
                alert.dismiss(animated: true, completion: {
                    
                })
            }
            
            alert.addAction(actionOkay)
            self.present(alert, animated: true) { }
        }
    }
}

extension DashboardVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let arr = arrListStorage else {
            return 1
        }
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListingTBC", for: indexPath) as! ListingTBC
        
        if isFromNewListing {
            cell.lblPrice.text = "Listing successful!"
            let imageThumb = UIImage(named: "SuccessThumbColor")?.withAlignmentRectInsets(UIEdgeInsets(top: -20, left: 0, bottom: -20, right: 0))
            cell.imgViwIcon.image = imageThumb
        }
        else if indexPath.row == 0 {
            cell.lblPrice.text = arrListStorage?[indexPath.row] ?? ""
            let imageThumb = UIImage(named: "Box_Color")?.withAlignmentRectInsets(UIEdgeInsets(top: -20, left: 0, bottom: -20, right: 0))
            cell.imgViwIcon.image = imageThumb
        }
        else if indexPath.row == 1 {
            cell.lblPrice.text = arrListStorage?[indexPath.row] ?? ""
            let imageThumb = UIImage(named: "Luggage_Color")?.withAlignmentRectInsets(UIEdgeInsets(top: -20, left: 0, bottom: -20, right: 0))
            cell.imgViwIcon.image = imageThumb
        }
        else if indexPath.row == 2 {
            cell.lblPrice.text = arrListStorage?[indexPath.row] ?? ""
            let imageThumb = UIImage(named: "Truck_Color")?.withAlignmentRectInsets(UIEdgeInsets(top: -20, left: 0, bottom: -20, right: 0))
            cell.imgViwIcon.image = imageThumb
        }
        
        cell.backgroundColor = ThemeColors.shared.themeGray()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isFromNewListing {
            return collectionView.frame.size
        }
        else {
            return CGSize(width: collectionView.frame.width - 25, height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let strSearchtext = searchBar.text else { return }
        if strSearchtext.lowercased() == "melbourne" {
            mapView.animate(toLocation: arrLocationsMel[indexPath.row].position)
        }
        else if strSearchtext.lowercased() == "sydney" {
            mapView.animate(toLocation: arrLocations[indexPath.row].position)
        }
    }
}
