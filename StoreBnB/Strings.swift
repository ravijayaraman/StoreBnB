//
//  Strings.swift
//  StoreBnB
//
//  Created by Tonatiuh C on 10/8/19.
//  Copyright © 2019 Ravi Jayaraman. All rights reserved.
//

import Foundation

//This swift file includes all the strings used in the application

//This is the structure for all the images used in the application
struct Images {
    
    //Shared instance to maintain singleton for images
    static let shared = Images()
    
    let surfBoard = "SurfSpaceLogo"
    let carLuggage = "CarLuggage"
    let luggage = "Luggage"
    let scuba = "Scuba"
    let campingTent = "CampingTent"
    let mapMarker = "MapMarker"
}

//This structure is used for all the view controllers in the application
struct ViewControllers {
    
    //Singleton to maintain one instance of the viewcontrollers structure
    static let shared = ViewControllers()
    
    let SpaceDetailsVC = "SpaceDetailsVC"
    let ListingTBC = "ListingTBC"
}

//This enum is for the titles used in the application
enum ScreenTitle: String {
    
    case MyListing = "My Listing"
    case Confirmed = "Confirmed"
}
