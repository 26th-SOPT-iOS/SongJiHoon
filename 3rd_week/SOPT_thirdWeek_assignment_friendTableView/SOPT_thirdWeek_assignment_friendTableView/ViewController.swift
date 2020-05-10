//
//  ViewController.swift
//  SOPT_thirdWeek_assignment_friendTableView
//
//  Created by 송지훈 on 2020/05/10.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func setting(_ sender: Any) {
        
        let slideUpMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        
        
        let friendAction = UIAlertAction(title: "친구 관리", style: .default, handler: {
            (alert:UIAlertAction!) -> Void in
        })
        let settingAction = UIAlertAction(title: "전체 설정", style: .default, handler: {
            (alert:UIAlertAction!) -> Void in
        })
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: {
            (alert:UIAlertAction!) -> Void in
        })
        
        slideUpMenu.addAction(friendAction)
        slideUpMenu.addAction(settingAction)
        slideUpMenu.addAction(cancelAction)
        
        self.present(slideUpMenu, animated: true, completion: nil)

        
        
        
    }
}

