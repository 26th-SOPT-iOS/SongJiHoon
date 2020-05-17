//
//  SignupViewController.swift
//  SOPT_secondWeek_assignment_1
//
//  Created by 송지훈 on 2020/04/27.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var phonenumberTextField: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    override func viewDidLoad() {
    
        self.navigationController?.navigationBar.isHidden = false      // 네비게이션 바 숨기기

        setTextField()
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "" // clear defaut value("BACK" text!)
        
        


       
    }
    
    
    @IBAction func signupButton(_ sender: Any) {
        
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = pwTextField.text else { return }
        guard let inputName = nameTextField.text else { return }
        guard let inputEmail = emailTextField.text else { return }
        guard let inputPN = phonenumberTextField.text else { return }

        SignupService.shared.login(id: inputID, pwd: inputPWD, email: inputName, name: inputEmail, phone: inputPN) { networkResult in
            switch networkResult {
            case .success(let message):
                guard let message = message as? String else { return }
                print("회원가입 성공")
                print("\(inputID)")
                print("\(inputPWD)")
                let alertViewController = UIAlertController(title: "회원가입 성공", message: message,
                                                            preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
                
                
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "회원가입 실패", message: message,
                                                            preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
    }
    func setTextField(){
        
        
        idTextField.addLeftPadding()
        pwTextField.addLeftPadding()
        nameTextField.addLeftPadding()
        
        
        idTextField.layer.cornerRadius = 22
        pwTextField.layer.cornerRadius = 22
        nameTextField.layer.cornerRadius = 22
        loginButton.layer.cornerRadius=24
        
        
        
        
        
        
    }
    

}
