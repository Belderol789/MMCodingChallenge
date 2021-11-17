//
//  ViewController.swift
//  MMCodingChallenge
//
//  Created by Kem Bel on 11/15/21.
//

import UIKit

class CountryListVC: UIViewController {
    
    let apiRequestManager = APIRequestManager()
    private var temporaryCountryList: [CountryModel] = []
    var viewModel: CountryListViewModel = CountryListViewModel()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        setViews()
        // Do any additional setup after loading the view.
    }
    
    private func getData() {
        apiRequestManager.get(url: APIPaths.all, responseType: CountryModel.self, parameters: nil) { [weak self] apiResult in
            switch apiResult {
            case .success(let response, let totalCount):
                self?.temporaryCountryList.append(response)
                if self?.temporaryCountryList.count == totalCount {
                    self?.viewModel.countryList = self?.temporaryCountryList ?? []
                    self?.temporaryCountryList.removeAll()
                    self?.tableView.reloadData()
                }
            case .error(let errorResponse):
                self?.showAlertWith(title: errorResponse.title, message: errorResponse.message, defaultBtnTitle: "OK", actions: [])
            }
        }
    }
    
    private func setViews() {
        tableView.register(CountryTableViewCell.nib, forCellReuseIdentifier: CountryTableViewCell.className)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
}

// MARK: - UITableViewDataSource
extension CountryListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.className, for: indexPath) as? CountryTableViewCell else { fatalError("Cell Nib not registered") }
        cell.country = viewModel.returnCountryOf(index: indexPath)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countryCount
    }
    
}

// MARK: - UITableViewDelegate
extension CountryListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let mapsString = viewModel.returnCountryOf(index: indexPath)?.maps?.googleMaps else { return }
        let mapVC = MapsVC(urlString: mapsString)
        self.present(mapVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
