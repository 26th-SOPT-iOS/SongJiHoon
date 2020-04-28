//
//  SignupViewController.swift
//  SOPT_secondWeek_assignment_1
//
//  Created by 송지훈 on 2020/04/27.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBAction func toScrollView(_ sender: Any) {
        guard let toscrollView = self.storyboard?.instantiateViewController(identifier: "scrollViewController") else {return}
                
                
                self.navigationController?.pushViewController(toscrollView, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        
        setTextField()
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "" // clear defaut value("BACK" text!)


       
    }
    
    
    func setTextField(){
        
        
        nameTextField.addLeftPadding()
        emailTextField.addLeftPadding()
        passwordTextField.addLeftPadding()
        
        
        nameTextField.layer.cornerRadius = 22
        emailTextField.layer.cornerRadius = 22
        passwordTextField.layer.cornerRadius = 22
        loginButton.layer.cornerRadius=24
        
        
    }
    

}
