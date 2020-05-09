//
//  DetailViewController.swift
//  SOPT_thridWeek_seminar_tableView
//
//  Created by 송지훈 on 2020/05/09.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    
    
    var imageName : String = ""
    var date : String = ""
    var subTitle : String = ""
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        initView()
        

    }
    

    
    @IBAction func backToButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    private func initView(){
        
        
        weatherImageView.image = UIImage(named: imageName)
        dateLabel.text = date
        subtitleLabel.text = subTitle
    }
}
