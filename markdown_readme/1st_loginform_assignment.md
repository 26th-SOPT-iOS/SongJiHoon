

# 데이터 전달을 이용한 로그인 폼 만들기

[이동하기]()

##  다른  viewController로 데이터 전달하기

~~~Swift

        guard let receiveViewController =
            self.storyboard?.instantiateViewController(identifier: "userinfoViewController") as? UserinfoViewController else {return}
        
        
        
        receiveViewController.userid = idTextLabel.text
        receiveViewController.userpw = pwTextLabel.text

        idTextLabel.text = nil
        pwTextLabel.text = nil



~~~

<code>receiveViewController</code> 를 활용해 id/pw label에서 입력된 값을 <br>
<code>UserinfoViewController</code> 에 전달 후,<br>

<code>UserinfoViewController</code>내 userid 변수에 대입<br>


버튼을 눌러 전달 한 뒤에는, 다시 돌아왔을때 label이 비워져 있어야 하기 때문에 <br>
<code>idTextLabel.text = nil</code> 처럼 nil 대입 (확실치 않음? 이 부분❓❓❓)<br>

---

##  기타 에러 핸들링

" this class is not key value coding-compliant for the key singupIdTextField.'<br>
라는 오류 발생해서, 한참 찾았었는데 결국 변수명 바꾸고 다시 제대로 매칭 안 한 나의 불상사...인걸로..<br>
___

" Warning: Attempt to present * on * which is already presenting (null) "

스토리보드 내에서 버튼을 이용해 다른 viewController로 touch Inside 를 준 상태에서,<br>
<code> self.present(receiveViewController, animated: true, completion: nil) </code><br>
를 다시 주는 바람에 충돌 문제가 일어났었다. 다음부터는 유의하는걸로....
  
 ---
 
  
