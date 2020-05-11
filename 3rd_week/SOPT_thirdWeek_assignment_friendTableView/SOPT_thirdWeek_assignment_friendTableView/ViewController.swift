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







class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var friendTableView: UITableView!
    @IBOutlet weak var friendsNumber: UILabel!
    
    var friendCollection : [Friend] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.isScrollEnabled = false
        myTableView.allowsSelection = false
        
        friendTableView.delegate = self
        friendTableView.dataSource = self
        
        
        
        
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



extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == friendTableView{
            return 62

        }
        else {                  // tableView == myTableView
            return 86
        }
    }
    
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        self.friendsNumber.text = "\(friendCollection.count)"
        
        
        if tableView == friendTableView{
            return friendCollection.count
        }
        else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if tableView == friendTableView{
            
            guard let FriendCell = tableView.dequeueReusableCell(withIdentifier: FriendCell.user_identifier, for: indexPath) as? FriendCell
                else { return UITableViewCell() }
            
            FriendCell.setFriendInformation(ImageName: friendCollection[indexPath.row].imageNum.getImageName(),
                                            name: friendCollection[indexPath.row].name,
                                            statusMessage: friendCollection[indexPath.row].statusMessage)
            
            FriendCell.layer.borderWidth = 1
            FriendCell.layer.borderColor = UIColor.white.cgColor
            
            
            return FriendCell
            
        }
        
        else{
            
            guard let myCell = tableView.dequeueReusableCell(withIdentifier: FriendCell.my_identifier, for: indexPath) as? FriendCell
                else { return UITableViewCell() }
            
            
            
            myCell.setmyInformation(ImageName: "profile8Img", name: "솝트", statusMessage: "나만 없어 고양이..")
            
      
            
            return myCell
        }

    }
    
    
    
}
