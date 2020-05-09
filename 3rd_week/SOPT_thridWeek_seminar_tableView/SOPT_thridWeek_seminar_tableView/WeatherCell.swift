//
//  WeatherCell.swift
//  SOPT_thridWeek_seminar_tableView
//
//  Created by 송지훈 on 2020/05/09.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    
    static let identifiers : String = "WeatherCell"
    
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func setDateInformation(weatherImageName: String, date: String, subTitle: String) {
        weatherImageView.image = UIImage(named: weatherImageName)
        dateLabel.text = date
        subtitleLabel.text = subTitle
    }

}
