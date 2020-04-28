//
//  ScrollViewController.swift
//  SOPT_secondWeek_assignment_1
//
//  Created by 송지훈 on 2020/04/28.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit


private struct navi_Float{
    
    static let NaviBarHeightSmallState: CGFloat = 100
    static let NaviBarHeightLargeState: CGFloat = 210
    
    // 네비게이션 바 상태별로 크기 다르게 설정하기
    
    static let ImageSizeForLargeState: CGFloat = 40
    static let ImageSizeForSmallState: CGFloat = 32

    static let ImageRightMargin: CGFloat = 0
    static let ImageLeftMargin: CGFloat = 0
    static let ImageBottomMarginForLargeState: CGFloat = 0
    static let ImageBottomMarginForSmallState: CGFloat = 0
    






}




class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavi()
        
        // Do any additional setup after loading the view.
    }
    
    
    

    func setNavi(){
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let image = UIImage(named: "Sopt_navigationTitle")
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        
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
