//
//  ViewController.swift
//  SOPT_thridWeek_seminar
//
//  Created by 송지훈 on 2020/05/09.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var namePicker: UIPickerView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var artistLabel: UILabel!
    
    private var musicList : [Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setMusicList()
        
        
        namePicker.delegate = self
        namePicker.dataSource = self
    }

    
    
    
    
    
    func setMusicList() {
        let music1 = Music(title: "삐삐", singer: "아이유", coverName: "album_iu")
        let music2 = Music(title: "가을타나봐", singer: "바이브", coverName: "album_vibe")
        let music3 = Music(title: "고백", singer: "양다일", coverName: "album_yangdail")
        let music4 = Music(title: "하루도 그대를 사랑하지 않은 적이 없었다.", singer: "임창정", coverName: "album_im")
        let music5 = Music(title: "Save (Feat. 팔토알토)", singer: "루피(Loopy)", coverName: "album_smtm7")
        let music6 = Music(title: "멋지게 인사하는 법 (Feat. 슬기)", singer: "자이언티", coverName: "album_ziont")
        let music7 = Music(title: "IDOL", singer: "방탄소년단", coverName: "album_bts")
        let music8 = Music(title: "시간이 들겠지 (Feat. Colde)", singer: "로꼬", coverName: "album_loco")
        let music9 = Music(title: "모든 날, 모든 순간", singer: "폴킴", coverName: "album_paul")
        let music10 = Music(title: "Way Back Home", singer: "숀(SHAUN)", coverName: "album_shaun")
        
        musicList = [music1, music2, music3, music4, music5, music6, music7, music8, music9, music10]
    }
    
    
    
}

extension ViewController : UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.musicList.count
    }
    
    
}

extension ViewController : UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return musicList[row].musicTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        imageView.image = musicList[row].albumImg
        titleLabel.text = musicList[row].musicTitle
        artistLabel.text = musicList[row].singer
    }
    
}
