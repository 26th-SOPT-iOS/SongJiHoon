//
//  ScrollViewController.swift
//  SOPT_secondWeek_assignment_1
//
//  Created by 송지훈 on 2020/04/28.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit





class ScrollViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var headerImage: UIImageView!
    
    
    override func viewDidLoad() {
        
     
        print(scrollView.contentOffset.y)
        self.navigationController?.navigationBar.isHidden = true        // 네비게이션 바 숨기기
        
//        scrollInteraction()

 
        super.viewDidLoad()
        
        scrollViewDidScroll(scrollView: scrollView)
        
        
        
        

        


    
        
        // Do any additional setup after loading the view.
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var scaleFactor:CGFloat = 0.0
        if scrollView.contentOffset.y < 0 {
            scaleFactor = -scrollView.contentOffset.y
        } else {
            scaleFactor = 1.0
        }
        self.headerImage.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
    }
    
    
    
 
    @IBAction func toLoginView(_ sender: Any) {

        
        
        self.navigationController?.popToRootViewController(animated: true)

  
        

        
    }


    


}
