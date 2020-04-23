

## 데이터 전달을 이용한 로그인 폼 만들기


#####다른  viewController로 데이터 전달하기

'''Swift

        guard let receiveViewController =
            self.storyboard?.instantiateViewController(identifier: "userinfoViewController") as? UserinfoViewController else {return}
        
        
        
        receiveViewController.userid = idTextLabel.text
        receiveViewController.userpw = pwTextLabel.text

        idTextLabel.text = nil
        pwTextLabel.text = nil



'''

'''receiveViewController'''를 활용해 id/pw label에서 입력된 값을 '''UserinfoViewController'''에 전달 후,


'''UserinfoViewController'''내 userid 변수에 대입

버튼을 눌러 전달 한 뒤에는, 다시 돌아왔을때 label이 비워져 있어야 하기 때문에 nil 대입 (확실치 않음? 이 부분❔)

