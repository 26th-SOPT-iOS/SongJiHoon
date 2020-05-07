//
//  ViewController.swift
//  SOPT_secondWeek_assignment_2
//
//  Created by 송지훈 on 2020/04/28.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet var uiButton: [UIButton]!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setButton()

    }

    
    
    func setButton(){
     
        for button in uiButton{
            button.layer.cornerRadius = 0.5 * button.layer.bounds.size.width 
        }
    }
    

}

