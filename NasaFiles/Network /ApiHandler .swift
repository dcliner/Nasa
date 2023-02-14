//
//  ApiHandler .swift
//  NasaFiles
//
//  Created by Derefaa Cline on 1/4/23.
//

import Foundation
class NasaApiHandler{
    static let shared = NasaApiHandler.init()
    var delegate:NasaDataTransferProtocol?
    private init() {}
    func getNData(){
        guard let url = URL.init(string: NasaUrls.Nurl.rawValue) else {return}
        
        let urlrequest = URLRequest.init(url: url)
        URLSession.shared.dataTask(with: urlrequest) { data, urlresponse, error in
            guard let data = data else{
                print ("No data from the url")
                return
            }
            do {
                let nasadetails:[NasaData] = try JSONDecoder().decode([NasaData].self, from: data)
                self.delegate?.collectnasadata(arrn: nasadetails)
            }catch{
                print (error)
            }
        }.resume()
    
    }
    
}

protocol NasaDataTransferProtocol {
    func collectnasadata(arrn: [NasaData])
}


