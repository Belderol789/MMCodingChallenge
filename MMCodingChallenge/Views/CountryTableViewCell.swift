//
//  CountryTableViewCell.swift
//  MMCodingChallenge
//
//  Created by Kem Bel on 11/17/21.
//

import UIKit

class CountryTableViewCell: UITableViewCell, Reusable {

    @IBOutlet weak var countryFlagImage: UIImageView!
    @IBOutlet weak var countryCapitalLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var dividerLabel: UILabel!
    
    var country: CountryModel? {
        didSet {
            countryNameLabel.text = country?.name.official
            if let countryTld = country?.tld?.first?.replacingOccurrences(of: ".", with: "") {
                countryFlagImage.image = UIImage(named: "\(countryTld)")
            }
            countryCapitalLabel.text = country?.capital?.first
            dividerLabel.isHidden = country?.capital?.first == nil
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        countryFlagImage.layer.masksToBounds = true
        countryFlagImage.layer.cornerRadius = 16
        countryFlagImage.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        countryFlagImage.layer.borderWidth = 0.5
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
