//
//  ViewController.swift
//  SOPT_thirdWeek_assignment_friendTableView
//
//  Created by 송지훈 on 2020/05/10.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit


extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}







class CellViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!

    
    var friendCollection : [Friend] = []
    var friendsNumber : Int = 0
    
    let sections : [String] = ["Me","Friends"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        myTableView.delegate = self
        myTableView.dataSource = self

        
        
        
        
        
        setFriends()

        
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
    
    
    private func setFriends(){
        
        let friend1 = Friend(name: "박섭트", statusMessage: "멍멍", imageNum: .one)
        let friend2 = Friend(name: "시튜시튜", statusMessage: "몽몽", imageNum: .two)
        let friend3 = Friend(name: "뽀림이", statusMessage: "왕~!", imageNum: .three)
        let friend4 = Friend(name: "이솝트", statusMessage: "뺴ㅒ애애애액", imageNum: .four)
        let friend5 = Friend(name: "박솝트", statusMessage: "멀바", imageNum: .five)
        let friend6 = Friend(name: "멍멍", statusMessage: "빼꼬미", imageNum: .six)
        let friend7 = Friend(name: "멍뭉", statusMessage: "헤헿ㅎㅎ", imageNum: .seven)
        let friend8 = Friend(name: "냥이", statusMessage: "냥냥펀치", imageNum: .eight)
        let friend9 = Friend(name: "강얼쥐", statusMessage: "종강시켜줘..", imageNum: .one)
        let friend10 = Friend(name: "뽀짝", statusMessage: "교수님 과제 그만..", imageNum: .two)
        let friend11 = Friend(name: "시튜시튜", statusMessage: "살려줘..", imageNum: .three)
        let friend12 = Friend(name: "홍길동", statusMessage: "집에 갈래..", imageNum: .four)
        let friend13 = Friend(name: "멍뭉멍", statusMessage: "멍멍!", imageNum: .five)



        
        friendCollection = [friend1,friend2,friend3,friend4,friend5,friend6,friend7,friend8,friend9,friend10,friend11,friend12,friend13]
        
        
    }
}



extension CellViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0
        {
            return 88
        }
        else
        {
            return 62

        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if tableView == friendTableView {
        if indexPath.section == 1{
            if editingStyle == UITableViewCell.EditingStyle.delete {
                 friendCollection.remove(at: indexPath.row)
                 tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
                
                tableView.reloadData()             // 데이터 반영하기 (삭제 시 , 친구 숫자가 줄어들어야 함 )
                
            }
        }


    }
    
    
    
    
    
    
    
}

extension CellViewController:UITableViewDataSource{
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        friendsNumber = friendCollection.count
        let friends_number : String = "  친구 \(friendsNumber)"
  
        if section == 1
        {
            
            return friends_number
        }
        else
        {
            return ""
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) { // 여기서 헤더 속성 변경
        if section == 1 {
            view.tintColor = .white // 배경색 흰색으로 바꾸기

            let header = view as! UITableViewHeaderFooterView
      
            header.textLabel?.textColor = .lightGray
            header.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 11)
        }

        


    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if section == 0{
            return 1
        }
        
        else if section == 1 {
            return friendCollection.count
        }
        
        else {
            return 0
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 1
        {
            guard let FriendCell = tableView.dequeueReusableCell(withIdentifier: FriendCell.user_identifier, for: indexPath) as? FriendCell
                else { return UITableViewCell() }
            
            FriendCell.setFriendInformation(ImageName: friendCollection[indexPath.row].imageNum.getImageName(),
                                            name: friendCollection[indexPath.row].name,
                                            statusMessage: friendCollection[indexPath.row].statusMessage)
            
            FriendCell.layer.borderWidth = 1
            FriendCell.layer.borderColor = UIColor.white.cgColor
            
            
            
            
            
            return FriendCell
        }
            
        else
        {
            guard let myCell = tableView.dequeueReusableCell(withIdentifier: FriendCell.my_identifier, for: indexPath) as? FriendCell
                else { return UITableViewCell() }
            
            
            
            myCell.setMyInformation(ImageName: "profile8Img", name: "솝트", statusMessage: "나만 없어 고양이..")
            

            myCell.layer.borderColor = UIColor.lightGray.cgColor
            myCell.layer.borderWidth = 0.5


            
  
               
            
            return myCell
        }



    }
    
    
    
    
    
}
