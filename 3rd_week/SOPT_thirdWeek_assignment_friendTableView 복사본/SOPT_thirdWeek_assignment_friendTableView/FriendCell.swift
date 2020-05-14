//
//  FriendCell.swift
//  SOPT_thirdWeek_assignment_friendTableView
//
//  Created by 송지훈 on 2020/05/11.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    
    static let my_identifier : String = "myProfileCell"
    static let user_identifier : String = "userProfileCell"
    

    
    
    @IBOutlet weak var myProfileImage: UIImageView!
    
    @IBOutlet weak var myName: UILabel!
    
    @IBOutlet weak var myStatusMessage: UILabel!
    
    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userStatusMessage: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

    
    func setFriendInformation(ImageName:String,name:String,statusMessage:String){
        userProfileImage.image = UIImage(named: ImageName)
        userName.text = name
        userStatusMessage.text = statusMessage
        
        
    }
    
    
    func setMyInformation(ImageName:String,name:String,statusMessage:String){
        myProfileImage.image = UIImage(named: ImageName)
        myName.text = name
        myStatusMessage.text = statusMessage
    
    

    }
}

