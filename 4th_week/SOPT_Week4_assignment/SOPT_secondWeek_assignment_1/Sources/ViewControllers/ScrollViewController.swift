//
//  ScrollViewController.swift
//  SOPT_thirdWeek_assignment_friendTableView
//
//  Created by 송지훈 on 2020/05/10.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    
    
    
    @IBOutlet weak var imgViewHeightLayout: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var headerImageHeight: CGFloat = 210
    var minHeaderImageHeight : CGFloat = 108
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func logoutButton(_ sender: Any) { // 로그아웃
        
        UserDefaults.standard.set(false, forKey: UserDefaultKeys.autoLoginCheck)
        self.dismiss(animated: true, completion: nil)
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


extension ScrollViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0.0 {
            // Scrolling down: 스크롤을 아래로 내릴때
            imgViewHeightLayout.constant = headerImageHeight - scrollView.contentOffset.y
        } else {
            // Scrolling up: 스크롤을 위로 올릴때
            var height = headerImageHeight - scrollView.contentOffset.y
            height = height > minHeaderImageHeight ? height : minHeaderImageHeight
            imgViewHeightLayout.constant = height
        }
    }
}
