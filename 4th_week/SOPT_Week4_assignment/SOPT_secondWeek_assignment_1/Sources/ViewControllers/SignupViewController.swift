//
//  SignupViewController.swift
//  SOPT_secondWeek_assignment_1
//
//  Created by 송지훈 on 2020/04/27.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    
    @IBOutlet var TextFieldCollection: [UITextField]!
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
            case .success:
                
                guard let receiveViewController =
                    self.storyboard?.instantiateViewController(identifier: "loginViewController") as? ViewController else {return}
                

                receiveViewController.userid = inputID
                receiveViewController.userpw = inputPWD

                
                receiveViewController.modalPresentationStyle = .fullScreen
                self.present(receiveViewController, animated: true, completion: nil)
                receiveViewController.loginButton.sendActions(for: .touchUpInside)      // 버튼 클릭하게 하도록 코드 작성
                    
                

                

                
            
                        
//
//                guard let message = message as? String else { return }
//                print("회원가입 성공")
//                print("\(inputID)")
//                print("\(inputPWD)")
//                let alertViewController = UIAlertController(title: "회원가입 성공", message: message,
//                                                            preferredStyle: .alert)
//                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
//                alertViewController.addAction(action)
//                self.present(alertViewController, animated: true, completion: nil)
//                
//                
                
                
                
                
                
                
                
                
                
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "회원가입 실패", message: message,
                                                            preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
                
                
                
                
                
                
                
                
            case .pathErr:
                self.showAlertViewController(message:" 사용자 입력 오류 ")
                
            case .serverErr:
                self.showAlertViewController(message: "서버 오류")
                
            case .networkFail:
                self.showAlertViewController(message: "네트워크 오류")
            }
        }
    }
    
    
    
    func showAlertViewController(message : String){
        let alertViewController = UIAlertController(title: "오류", message: message,
                                                    preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true, completion: nil)

        
    }
    
    
    func setTextField(){
        
        
        
        
        for textField in TextFieldCollection{
            
            textField.addLeftPadding()
            textField.layer.cornerRadius = 22
            
        }

        loginButton.layer.cornerRadius=24
        
        
        
        
        
        
    }
    

}
