//
//  FriendInformation.swift
//  SOPT_thirdWeek_assignment_friendTableView
//
//  Created by 송지훈 on 2020/05/11.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit


struct Friend{
    
    var imageNum : profile
    var name : String
    var statusMessage : String
    
    init(name: String, statusMessage:String,imageNum:profile)
    {
        self.name = name
        self.statusMessage = statusMessage
        self.imageNum = imageNum
    }
}


enum profile{
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    
    func getImageName() -> String{
        switch self{
            case .one:
                return "profile1Img"
            case .two:
                return "profile2Img"
            case .three:
                return "profile3Img"
            case .four:
                return "profile4Img"
            case .five:
                return "profile5Img"
            case .six:
                return "profile6Img"
            case .seven:
                return "profile7Img"
            case .eight:
                return "profile8Img"
        }
    }
}
