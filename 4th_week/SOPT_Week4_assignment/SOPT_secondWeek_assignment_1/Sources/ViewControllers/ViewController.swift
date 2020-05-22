//
//  ViewController.swift
//  SOPT_secondWeek_assignment_1
//
//  Created by 송지훈 on 2020/04/27.
//  Copyright © 2020 송지훈. All rights reserved.
//


import UIKit
import BEMCheckBox

struct UserDefaultKeys{
    static let autoLoginCheck = "isAutoLoginChecked"
    static let token = "token"
}


extension UITextField{
    
    func addLeftPadding() {
        let padding = UIView(frame: CGRect(x:0, y:0, width:18, height:self.frame.height)) // set padding in UITextField
        self.leftView = padding
        self.leftViewMode = ViewMode.always
    }
}

    
class ViewController: UIViewController,BEMCheckBoxDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signupButton: UILabel!
    
    
    @IBOutlet weak var autologinLabel: UILabel!
    
    var userid : String?
    var userpw : String?
    
    var handle: Int = 0
    
    var is_auto_login : Int = 0
    
    let autoLogincheckBox = BEMCheckBox.init(frame: CGRect.init(x: CGFloat(0), y: CGFloat(0), width: CGFloat(15), height: CGFloat(15)))
    
    
    
    override func viewDidLoad() {
        
        

        setTextField()
       
        self.setNavigationBar()
        setCheckBox()
        autoLogincheckBox.delegate = self

        
        super.viewDidLoad()
        setInput()
        setLabel()
        autoLoginCheck()
        
//        autoLogin()
        
  
        
        // Do any additional setup after loading the view.
    }


    
    

    @IBAction func loginButtonTouch(_ sender: Any) {
        
        let tabStoryBoard = UIStoryboard(name: "TableView", bundle: nil)
        
        
        guard let inputID = emailTextField.text else { return }
        guard let inputPWD = passwordTextField.text else { return }

        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
            switch networkResult {
            case .success(let token):
                
                if self.autoLogincheckBox.on {
                    UserDefaults.standard.set(true, forKey: UserDefaultKeys.autoLoginCheck)
                }
                
                UserDefaults.standard.set(token, forKey: UserDefaultKeys.token)
                

                guard let tabbarController = tabStoryBoard.instantiateViewController(identifier:
                    "tabBarStoryBoard") as? UITabBarController else { return }

                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
                
                
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message,
                                                            preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                
                
                
            case .pathErr:
                self.showAlertViewController(message: "올바른 ID 및 PW를 입력해주세요")
                
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
    
    func autoLoginCheck(){
        if UserDefaults.standard.bool(forKey: UserDefaultKeys.autoLoginCheck) {
            // UserDefaultKeys 가 존재하면 AutoLogin 처리
            
            let tabStoryBoard = UIStoryboard(name: "TableView", bundle: nil) // 탭 스토리 보드 정의
            
            guard let tabbarController = tabStoryBoard.instantiateViewController(identifier:
                  "tabBarStoryBoard") as? UITabBarController else { return }

            
              
              
              tabbarController.modalPresentationStyle = .fullScreen // 풀 스크린으로 모달 띄우기
              self.present(tabbarController, animated: true, completion: nil)
                
        }
    }
    
//    func didTap(_ checkBox: BEMCheckBox) {
//
//        if is_auto_login == 0
//        {
//            self.autoLogincheckBox.setOn(true, animated:true)
//            is_auto_login = 1
//            print("SET TRUE")
//        }
//        else
//        {
//            self.autoLogincheckBox.setOn(false, animated:true)
//
//            is_auto_login = 0
//            print("SET FALSE")
//
//        }
//    }

    
    func setTextField(){
        
        
        
        emailTextField.layer.cornerRadius = 22
        emailTextField.addLeftPadding()
        passwordTextField.layer.cornerRadius = 22
        passwordTextField.addLeftPadding()
        
        
        loginButton.layer.cornerRadius = 24
    }
    
    
    func setCheckBox(){
        
        
        
        self.autoLogincheckBox.onAnimationType = BEMAnimationType.fill
        self.autoLogincheckBox.offAnimationType = BEMAnimationType.fill
        
        
        
        self.view.addSubview(self.autoLogincheckBox)
        self.autoLogincheckBox.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraint(NSLayoutConstraint(item: self.autoLogincheckBox, attribute: .top, relatedBy: .equal, toItem: self.passwordTextField, attribute: .bottom, multiplier: 1, constant: 12))
        self.view.addConstraint(NSLayoutConstraint(item: self.autoLogincheckBox, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 61))


        
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
    
    func setInput(){
        
        let name = self.userid
        let pw = self.userpw
        
        
        
        emailTextField.text = name
        passwordTextField.text = pw
        
    }

    
}

