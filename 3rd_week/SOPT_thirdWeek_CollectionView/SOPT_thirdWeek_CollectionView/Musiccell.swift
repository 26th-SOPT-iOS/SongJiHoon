//
//  Musiccell.swift
//  SOPT_thirdWeek_CollectionView
//
//  Created by 송지훈 on 2020/05/09.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class Musiccell: UICollectionViewCell {
    
    
    @IBOutlet weak var albumIImageView: UIImageView!
    static let identifiers : String = "MusicCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    
    func set(_ musicInformation: Music){
        
        albumIImageView.image = musicInformation.albumImg
        titleLabel.text = musicInformation.musicTitle
        singerLabel.text = musicInformation.singer
        
    }
}
