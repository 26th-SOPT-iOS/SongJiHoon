//
//  Music.swift
//  SOPT_thirdWeek_CollectionView
//
//  Created by 송지훈 on 2020/05/09.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

struct Music {
    var albumImg: UIImage?
    var musicTitle: String
    var singer: String
    
    init(title: String, singer: String, coverName: String) {
        self.albumImg = UIImage(named: coverName)
        self.musicTitle = title
        self.singer = singer
    }
}
