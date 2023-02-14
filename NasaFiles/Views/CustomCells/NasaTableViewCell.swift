//
//  TableViewCell.swift
//  NasaFiles
//
//  Created by Derefaa Cline on 1/4/23.
//

import UIKit

class NasaTableViewCell: UITableViewCell {
    @IBOutlet weak var Name:UILabel!
    @IBOutlet weak var NameType:UILabel!
    @IBOutlet weak var Reclass:UILabel!
    @IBOutlet weak var Mass:UILabel!
//    @IBOutlet weak var Fall:UILabel!
    @IBOutlet weak var Year:UILabel!
//    @IBOutlet weak var Recalt:UILabel!
    @IBOutlet weak var Reclong:UILabel!
    @IBOutlet weak var Lat:UILabel!
    @IBOutlet weak var Long:UILabel!
    
    var nasadata:NasaData?{
    didSet{
        Name.text = "Name: \(nasadata?.name ?? "No name")"
        NameType.text = "Nametype: \(nasadata?.nametype ?? "No nametype")"
        Reclass.text = "Reclass: \(nasadata?.recclass ?? "No reclass")"
        Mass.text = "Mass: \(nasadata?.mass ?? "No mass" )"
       // Fall.text = "Fall: \(nasadata?.fall ?? "No fall")"
        Year.text = "Year: \(nasadata?.year?.dateFormatter(style: .medium) ?? "No year")"
  //      Recalt.text = "Recalt: \(nasadata?.reclat ?? "no reclat")"
        Reclong.text = "Reclong: \(nasadata?.reclong ?? "No reclong")"
      //  Lat.text = "Lat: \(nasadata?.geolocation?.latitude ?? "No Lat")"
       // Long.text = "Long: \(nasadata?.geolocation?.longitude ?? "No Long")"
        
    }
        }

    
}

extension String{
    

        
        func dateFormatter(style: DateFormatter.Style) -> String? {
             let formatter = DateFormatter()
             formatter.dateFormat = "yyyy-MM-dd"
             formatter.timeZone = .current
             formatter.dateStyle = style
             return formatter.string(from: Date())
    }
    
}
