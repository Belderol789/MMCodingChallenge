//
//  ViewController.swift
//  MMCodingChallenge
//
//  Created by Kem Bel on 11/15/21.
//

import UIKit

class CountryListVC: UIViewController {
    
    let apiRequestManager = APIRequestManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    private func getData() {
        apiRequestManager.get(url: APIPaths.all, responseType: CountryModel.self, parameters: nil) { apiResult in
            
        }
    }


}

