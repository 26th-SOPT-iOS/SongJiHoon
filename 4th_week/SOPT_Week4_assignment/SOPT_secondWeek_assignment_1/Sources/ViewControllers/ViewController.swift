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
    
    
    
    var userid : String?
    var userpw : String?
    
    var handle:Int = 0
    
    var is_auto_login : Int = 0

    let checkBox = BEMCheckBox.init(frame: CGRect.init(x: CGFloat(60), y: CGFloat(396+44), width: CGFloat(15), height: CGFloat(15)))

    
    
    override func viewDidLoad() {
        
        
    
        setTextField()
       
        self.setNavigationBar()
        setCheckBox()

        
        super.viewDidLoad()
        setInput()
        setLabel()
        
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
                

                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                
                
                if self.checkBox.on{
                    let dataSave = UserDefaults.standard
                    dataSave.setValue(true, forKey: UserDefaultKeys.autoLoginCheck)


                    UserDefaults.standard.synchronize()
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
    
//
//    func autoLogin() {
//        if let userid = UserDefaults.standard.string(forKey: "id") {
//
//            if let pw = UserDefaults.standard.string(forKey: "pw")  {
//
//                //로그인 통신 함수
//                LoginService.shared.login(id:userid, pwd: pw)
//                    }
//                }
//            }
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
        
        
        
        self.checkBox.onAnimationType = BEMAnimationType.fill
        self.checkBox.offAnimationType = BEMAnimationType.fill
        
        self.view.addSubview(self.checkBox)
    
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

