//
//  NasaDataModel.swift
//  NasaFiles
//
//  Created by Derefaa Cline on 1/4/23.
//

import Foundation
struct NasaData:Codable{
    let name : String?
    let id : String?
    let nametype : String?
    let recclass : String?
    let mass : String?
    let fall : String?
    let year : String?
    let reclat : String?
    let reclong : String?
    let geolocation : Geolocation?
    
}

struct Geolocation : Codable {
    let latitude : String?
    let longitude : String?
    
}
