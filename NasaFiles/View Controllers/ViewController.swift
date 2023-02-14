//
//  ViewController.swift
//  NasaFiles
//
//  Created by Derefaa Cline on 1/4/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NasaDataTransferProtocol {
    
    var nasaarray = [NasaData]()
    @IBOutlet weak var Nasatableview: UITableView!

    override func viewDidLoad() {
        self.Nasatableview.rowHeight = UITableView.automaticDimension;
        self.Nasatableview.estimatedRowHeight = 100
        Nasatableview.delegate = self
        Nasatableview.dataSource = self
        let ObjNasaApiHandler = NasaApiHandler.shared
        ObjNasaApiHandler.delegate = self
        ObjNasaApiHandler.getNData()
        super.viewDidLoad()
        
        Nasatableview.register(UINib(nibName: "NasaTableViewCell", bundle: nil), forCellReuseIdentifier: "NasaTableViewCell")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Nasatableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nasaarray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NasaTableViewCell")as! NasaTableViewCell
        
        cell.nasadata = nasaarray[indexPath.row]
        return cell
    }
    
    func collectnasadata(arrn: [NasaData]) {
        nasaarray = arrn
        DispatchQueue.main.async {
            self.Nasatableview.reloadData()
        }
    }


}

