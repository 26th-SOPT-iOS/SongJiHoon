

# 데이터 전달을 이용한 로그인 폼 만들기

[이동하기](https://github.com/26th-SOPT-iOS/SongJiHoon/tree/master/1st_week/SOPT_firstWeek_assignment_2)

##  다른  viewController로 데이터 전달하기



```Swift

guard let receiveViewController =
            self.storyboard?.instantiateViewController(identifier: "userinfoViewController") as? UserinfoViewController else {return}
        
        
        
receiveViewController.userid = idTextLabel.text
receiveViewController.userpw = pwTextLabel.text

idTextLabel.text = nil
pwTextLabel.text = nil

```

~~~

<code>receiveViewController</code> 를 활용해 id/pw label에서 입력된 값을 <br>
<code>UserinfoViewController</code> 에 전달 후,<br>

<code>UserinfoViewController</code>내 userid 변수에 대입<br>


버튼을 눌러 전달 한 뒤에는, 다시 돌아왔을때 label이 비워져 있어야 하기 때문에 <br>
<code>idTextLabel.text = nil</code> 처럼 nil 대입 (확실치 않음? 이 부분❓❓❓)<br>

---

### 입력한 부분을 넘겨주기


```Swift

private func setLabels(){
        
        
    guard let name = self.userid else {return}
    guard let pw = self.userpw else {return}
        
        
    nameLabel.text = name
    passwordLabel.text = pw
        
}


```

방금 전달받은 데이터를 <code> guard let </code>로 선언한 변수에 넣어주고 <br>
해당 Label.text에 넣어준다!

여기서 guard let은 오류가 발생했을 시 예외 처리를 해주는 <code> return </code> 구문이 존재하는 형태.

---

### 모달로 전달할 때 꽉 차게 전달

```Swift
receiveViewController.modalPresentationStyle = .fullScreen
self.present(receiveViewController, animated: true, completion: nil)
```


IOS13 이후부터 modal 로 전달시 기본값이 맨 위에 부분은 남기고 올라오는 형식으로 변경 되었다.
``` modalPresentationStyle = .fullScreen ``` 을 활용해서 꽉 차게 변경



---
###로그아웃 시 가입화면이 아닌 로그인 화면으로

```Swift
let navigationController = self.presentingViewController as?UINavigationController
        
               
self.dismiss(animated:true){
    _ = navigationController?.popViewController(animated: true)
}
```

로그아웃 IBAction 부분에 ```popViewController``` 를 활용한 이벤트를 넣어줘서
가장 첫번째 화면(로그인 부분)으로 넘어가도록 해준다.

---

##  기타 에러 핸들링

" this class is not key value coding-compliant for the key singupIdTextField.'<br>
라는 오류 발생해서, 한참 찾았었는데 결국 변수명 바꾸고 다시 제대로 매칭 안 한 나의 불상사...인걸로..<br><br><br>




" Warning: Attempt to present * on * which is already presenting (null) "

스토리보드 내에서 버튼을 이용해 다른 viewController로 touch Inside 를 준 상태에서,<br>
<code> self.present(receiveViewController, animated: true, completion: nil) </code><br>
를 다시 주는 바람에 충돌 문제가 일어났었다. 다음부터는 유의하는걸로....
  
 ---
 
  
