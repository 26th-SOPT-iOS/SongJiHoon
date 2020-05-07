//
//  ViewController.swift
//  SOPT_firstWeek_assignment_2
//
//  Created by 송지훈 on 2020/04/23.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var idTextLabel: UITextField!
    
    @IBOutlet weak var pwTextLabel: UITextField!
    
    
    
    
    
    @IBOutlet weak var mainLogo: UIImageView!
    
    

    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        

        
        
    }
    
    
    @IBAction func LoginSection(_ sender: Any) {
        
        
        guard let receiveViewController =
            self.storyboard?.instantiateViewController(identifier: "userinfoViewController") as? UserinfoViewController else {return}
        
        
        
        receiveViewController.userid = idTextLabel.text
        receiveViewController.userpw = pwTextLabel.text
        
        
        receiveViewController.modalPresentationStyle = .fullScreen
        self.present(receiveViewController, animated: true, completion: nil)
        
        
        idTextLabel.text = nil
        pwTextLabel.text = nil
        
        
    }
    
    
    
    

}


