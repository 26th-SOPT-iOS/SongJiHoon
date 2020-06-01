//
//  myPageViewController.swift
//  uploadSection
//
//  Created by 송지훈 on 2020/05/31.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class myPageViewController: UIViewController {

    
    @IBOutlet weak var view1: UIView!
    
    
    @IBOutlet weak var view2: UIView!
    
    override func viewDidLoad() {
        setborder()

        super.viewDidLoad()
        
        setnavi()
  
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func setnavi(){
        
        
        let backImage = UIImage(named: "btBack")

        
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: backImage, style:.plain, target: nil, action: nil)


        self.navigationController?.navigationBar.barTintColor = UIColor.white // 네비게이션 바 색상 흰색으로 바꾸기
        self.navigationController?.navigationBar.shadowImage = UIImage() // 네비게이션 바 구분 선 지우기

        
        
    }
    
    
    func setborder(){
        
        self.view1.layer.borderColor = UIColor.red.cgColor
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
