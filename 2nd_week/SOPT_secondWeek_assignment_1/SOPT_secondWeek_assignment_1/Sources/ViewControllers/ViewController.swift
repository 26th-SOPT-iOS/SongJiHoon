//
//  ViewController.swift
//  SOPT_secondWeek_assignment_1
//
//  Created by 송지훈 on 2020/04/27.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

extension UITextField{
    
    func addLeftPadding() {
        let padding = UIView(frame: CGRect(x:0, y:0, width:18, height:self.frame.height)) // set padding in UITextField
        self.leftView = padding
        self.leftViewMode = ViewMode.always
    }
}


class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signupButton: UILabel!
    
    
    
    var handle:Int = 0
    

    
    
    override func viewDidLoad() {
        
        
    
        setTextField()
        
        self.setNavigationBar()
        
        super.viewDidLoad()
        setLabel()
        
  
        
        // Do any additional setup after loading the view.
    }



    @IBAction func loginButtonTouch(_ sender: Any) {
        
        guard let inputID = emailTextField.text else { return }
        guard let inputPWD = passwordTextField.text else { return }

        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
            switch networkResult {
            case .success(let token):
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
                    "customTabbarController") as? UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message,
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
        
        
        
        emailTextField.layer.cornerRadius = 22
        emailTextField.addLeftPadding()
        passwordTextField.layer.cornerRadius = 22
        passwordTextField.addLeftPadding()
        
        
        loginButton.layer.cornerRadius = 24
    }
    
    
    
    
    
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer){
        
        guard let nextView = self.storyboard?.instantiateViewController(identifier: "signupViewController") else {return}
        
        
        
        self.navigationController?.pushViewController(nextView, animated: true)
        
    
    }
    
    
    func setLabel(){
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        
        self.signupButton.isUserInteractionEnabled = true
        self.signupButton.addGestureRecognizer(labelTap)
        
        
        
    }
    
    
    func setNavigationBar(){
        
        navigationController?.navigationBar.barTintColor = UIColor.white        // navigation bar color change
        navigationController?.navigationBar.shadowImage = UIImage()             // underline clear
        


    }
    
}

