//
//  SignupViewController.swift
//  SOPT_firstWeek_assignment_2
//
//  Created by 송지훈 on 2020/04/23.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var signupIdTextField: UITextField!
    @IBOutlet weak var signupPwTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        
        
    }
    


    @IBAction func toNextView(_ sender: Any) {
        
        
        
        guard let receiveViewController =
            self.storyboard?.instantiateViewController(identifier: "userinfoViewController") as? UserinfoViewController else {return}
        
        
        
        receiveViewController.userid = signupIdTextField.text
        receiveViewController.userpw = signupPwTextField.text
        
        self.present(receiveViewController, animated: true, completion: nil)
        
        
        signupIdTextField.text = nil
        signupPwTextField.text = nil
        
        
        
        
    }
}
