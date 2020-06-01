//
//  ViewController.swift
//  imageExample
//
//  Created by 송지훈 on 2020/06/01.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit
import Kingfisher



// alamofire을 이용해 이미지 다운로드 가능하지만,
// 들어가는 이미지 수가 많아 지게 되면, 매번 실행할때마다 버벅일 수 있음
// --> 그래서 캐시를 활용해 최초 다운로드 할때만 사용한다.
// kingfihser 는 따로 이미지를 따올때 캐시를 활용해서 저장하기 때문에
// 효율적으로 이미지를 불러 올 수 있다!!




extension UIImageView {
    func setImage(from url: String) {                           // 이 기본 함수에 대해서 kingfisher 를 이용해 커스텀 할 예정
        
        // URL이 들어오는 것을 Cache 키로 사용
        let cache = ImageCache.default
        cache.removeImage(forKey: url)                          // 이거 없어도 기본적 동작은 가능함
        self.kf.indicatorType = .activity                       // 그 이미지 다운로드 하고 있다는 걸 나타내기 위해 indicator (동그라미 돌아가는거) 표시
        cache.retrieveImage(forKey: url) { result in
            switch result {                                     // 저번 로그인 및 회원 가입
                                                                // 캐시에 이미지가 있는 경우
            case .success(let value):                           // 성공했을때?
                switch value.cacheType {
                                                            // setImage을 호출 시, 자동으로 캐시에 저장하고 호출함
                case .none: self.kf.setImage(with: URL(string: url)!, placeholder: UIImage(systemName: "pencil"), options: [.transition(.fade(1))])
                // 이미지 업로드 성공했을때 1초 fade 효과 넣어주고, 로딩하는 동안  pencil 이미지로 placeholder 를 달아줌
                case .memory: self.image = value.image
                case .disk: self.image = value.image
                }
            case .failure(let error):           // 만약 해당 url에 사진 불러오는 걸 실패한다면,
                print(error.errorCode) // 에러 코드 출력하고
                self.image = UIImage()
            }
        }
    }
}



class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func downloadImg(_ sender: Any) {
        
        
        
        let url:String = "https://picsum.photos/400/300"
        
        imgView.setImage(from:url)
        
//
//
//        imgView.kf.indicatorType = .activity
//
//        imgView.kf.setImage(with: imgURL, placeholder: nil, options: [.transition(.fade(1.1))], progressBlock: nil)
//

        
    }
    

}

