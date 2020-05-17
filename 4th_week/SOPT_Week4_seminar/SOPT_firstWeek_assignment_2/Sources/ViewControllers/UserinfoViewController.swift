//
//  UserinfoViewController.swift
//  SOPT_firstWeek_assignment_2
//
//  Created by 송지훈 on 2020/04/23.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit




class UserinfoViewController: UIViewController {
    
    var userid : String?
    var userpw : String?



    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()

        // Do any additional setup after loading the view.
    }
    
    private func setLabels(){
        
        
        guard let name = self.userid else {return}
        guard let pw = self.userpw else {return}
        
        
        nameLabel.text = name
        passwordLabel.text = pw
        
    }

    @IBAction func backToLogin(_ sender: Any) {
        
       
        let navigationController = self.presentingViewController as?UINavigationController
        
        
        
        self.dismiss(animated:true){
            _ = navigationController?.popViewController(animated: true)
        }
        
    
       
       

        
        

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
