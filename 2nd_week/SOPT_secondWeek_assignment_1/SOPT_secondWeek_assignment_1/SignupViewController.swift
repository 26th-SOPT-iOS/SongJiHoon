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
    
    
    
    override func viewDidLoad() {
    
        self.navigationController?.navigationBar.isHidden = false      // 네비게이션 바 숨기기

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
