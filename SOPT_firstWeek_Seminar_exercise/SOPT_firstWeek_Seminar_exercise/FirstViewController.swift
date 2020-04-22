//
//  FirstViewController.swift
//  SOPT_firstWeek_Seminar_exercise
//
//  Created by 송지훈 on 2020/04/23.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    
    
    @IBOutlet weak var onOffLabel: UISwitch!
    
    
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func toNextView(_ sender: Any) {
        
        
        
        guard let receiveViewController =
            self.storyboard?.instantiateViewController(identifier: "secondViewController") as? SecondViewController else {return}
        
        
        receiveViewController.name = nameLabel.text
        receiveViewController.email = emailLabel.text
        receiveViewController.isOnOff = onOffLabel.isOn
        receiveViewController.frequency = slider.value
        
        self.present(receiveViewController, animated: true, completion: nil)
        
    }
    




}
