//
//  ScrollViewController.swift
//  SOPT_secondWeek_assignment_1
//
//  Created by 송지훈 on 2020/04/28.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit



class ScrollViewController: UIViewController {
    
   
    
    let headerViewMaxHeight: CGFloat = 100
    let headerViewMinHeight: CGFloat = 0
    let scrollTopEdgeInsets: CGFloat = 210
    
    
    @IBOutlet weak var headerImage: UIImageView!
    


    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var headerViewInitialHeightConstraintConstant: CGFloat!
  
    
    
  
    
    
    override func viewDidLoad() {
        
     
//        print(scrollView.contentOffset.y)
        self.navigationController?.navigationBar.isHidden = true
        // 네비게이션 바 숨기기
        
        self.headerViewInitialHeightConstraintConstant = self.heightConstraint.constant

        self.scrollView.delegate = self
        self.scrollView.contentInsetAdjustmentBehavior = .never
//        scrollInteraction()

 
        super.viewDidLoad()
        

        


    
        
        // Do any additional setup after loading the view.
    }


    @IBAction func toLoginView(_ sender: Any) {

        
        
        self.navigationController?.popToRootViewController(animated: true)

  
        

        
    }
    

    

    

}

extension ScrollViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        



        let y :CGFloat = scrollView.contentOffset.y
 
        if y < 0 {
            heightConstraint.constant = scrollTopEdgeInsets - y
            
        }else{
            
            var height = scrollTopEdgeInsets - y
            height = height > 88 ? height : 88
            heightConstraint.constant = height
            
        }

        
    }
}
