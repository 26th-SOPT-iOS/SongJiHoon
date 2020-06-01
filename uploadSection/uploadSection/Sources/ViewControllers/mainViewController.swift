//
//  mainViewController.swift
//  uploadSection
//
//  Created by 송지훈 on 2020/05/31.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class mainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setnavi()

        // Do any additional setup after loading the view.
    }
    

    
     
     func setnavi(){
         
         //imgLogo
         let backImage = UIImage(named: "btBack")
        let logoImage = UIImage(named: "imgLogo")

         
         self.navigationItem.titleView = UIImageView(image: logoImage)    // 로고 이미지 정하기

         self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: backImage, style:.plain, target: nil, action: nil)


         self.navigationController?.navigationBar.barTintColor = UIColor.white // 네비게이션 바 색상 흰색으로 바꾸기
         self.navigationController?.navigationBar.shadowImage = UIImage() // 네비게이션 바 구분 선 지우기

         
         
     }
     

}
