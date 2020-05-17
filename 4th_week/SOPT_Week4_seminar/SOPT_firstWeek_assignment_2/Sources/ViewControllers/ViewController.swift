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
        
        

            
            guard let inputID = idTextLabel.text else { return }
            guard let inputPWD = pwTextLabel.text else { return }
            
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
        
        
        
            guard let receiveViewController =
                self.storyboard?.instantiateViewController(identifier: "userinfoViewController") as? UserinfoViewController else {return}
            
            
            
            receiveViewController.userid = idTextLabel.text
            receiveViewController.userpw = pwTextLabel.text
            
            
            receiveViewController.modalPresentationStyle = .fullScreen
            self.present(receiveViewController, animated: true, completion: nil)
            
            
        
        }
        

        
//        idTextLabel.text = nil
//        pwTextLabel.text = nil
        
        
    }
    
    
    
    




