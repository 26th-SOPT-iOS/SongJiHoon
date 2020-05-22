

# Alamofire을 이용한 로그인 및 회원가입 기능 구현

[이동하기](https://github.com/26th-SOPT-iOS/SongJiHoon/tree/master/4th_week/SOPT_Week4_assignment)
___
- 사용 개념 : Cocoapods 연동, Alamofire HTTP 통신

- 과제 목표 : 
 1. 회원가입 기능 구현 하기
 2. 회원가입 완료 시, 자동으로 로그인 완료 화면으로 넘어가기 (도전 과제 1)
 3. 자동 로그인 기능 구현하기 (도전 과제 2)


___



(과제 결과물) <br>
![자동로그인](https://user-images.githubusercontent.com/60260284/82643009-cb905180-9c49-11ea-86aa-787f63fa23bd.gif)
![회원가입 후 자동로그인](https://user-images.githubusercontent.com/60260284/82643062-e19e1200-9c49-11ea-98cd-2ec156e92a6f.gif)





___
## 프로젝트 폴더링


![폴더링](https://user-images.githubusercontent.com/60260284/82640911-64bd6900-9c46-11ea-978b-d7edf7022bfb.png)

간단한 프로젝트 같은 경우에는 swift 파일, 스토리 보드 파일이 적어서 따로 구분을 해주지 않아도 되지만, <br>
이후에 대규모 프로젝트를 위해서 폴더링 하는 습관을 들이도록 하자... 꼭...........!

___

##  다른 스토리 보드내 ViewController 호출하기

```Swift
let tabStoryBoard = UIStoryboard(name: "TableView", bundle: nil)
```
우선 다른 스토리보드를 name을 통해 정의한다.

![스크린샷 2020-05-22 오후 4 03 36](https://user-images.githubusercontent.com/60260284/82640587-d21cca00-9c45-11ea-9af7-b5173b768993.png)
<br>
여기서의 name 은 스토리보드 파일 이름을 사용 한다!


```Swift
             guard let tabbarController = tabStoryBoard.instantiateViewController(identifier:
                   "tabBarStoryBoard") as? UITabBarController else { return }

             tabbarController.modalPresentationStyle = .fullScreen
             self.present(tabbarController, animated: true, completion: nil)
```

![스크린샷 2020-05-22 오후 4 05 58](https://user-images.githubusercontent.com/60260284/82640780-245deb00-9c46-11ea-8226-f0c5db16cc0c.png)

여기에 있는 Storyboard Id를 identifier에 넣어서 표시하고자 하는 Viewcontroller 와 연결 시켜 준다.
이후에 .fullScreen 으로 modal style을 정해주고 Present 해준다.


___

## 회원가입 후 자동 로그인 기능 구현하기


![회원가입 후 자동로그인](https://user-images.githubusercontent.com/60260284/82643062-e19e1200-9c49-11ea-98cd-2ec156e92a6f.gif)

<br>


```Swift
        SignupService.shared.login(id: inputID, pwd: inputPWD, email: inputName, name: inputEmail, phone: inputPN) { networkResult in
            switch networkResult {
            case .success:
                
                guard let receiveViewController =
                    self.storyboard?.instantiateViewController(identifier: "loginViewController") as? ViewController else {return}
                

                receiveViewController.userid = inputID
                receiveViewController.userpw = inputPWD

                
                receiveViewController.modalPresentationStyle = .fullScreen
                self.present(receiveViewController, animated: true, completion: nil)
                receiveViewController.loginButton.sendActions(for: .touchUpInside)      // 버튼 클릭하게 하도록 코드 작성
```

회원가입이 성공했을 경우(.success 부분) 내에서만 자동으로 넘기는 코드를 처리 해주었다. <br>
login폼을 가지고 있는 viewController에 <code>userid</code>  <code> userpw </code> 라는 변수를 선언 해두고,<br>
회원가입 textField창에 들어가있는 <code>inputID</code>  <code>inputPWD</code> String 변수를 <br>
userid/userpw 쪽으로 넘겨주었다.

그러고 나서 <code>loginButton</code> 로그인 버튼 객체에다가<br>
 <code>sendActions(for: .touchUpInside) </code>  버튼을 누르는 액션을 주어서 바로 로그인이 되도록 처리 했다.


___

###  자동 로그인 기능 구현하기

![자동로그인](https://user-images.githubusercontent.com/60260284/82643009-cb905180-9c49-11ea-86aa-787f63fa23bd.gif)
<br>


우선 체크박스 기능을 구현하기 위해 BEMCheckBox 모델을 활용했다.<br>
설치를 위해 해당 프로젝트 내에 있는 podFile에서<br>

![스크린샷 2020-05-22 오후 4 15 18](https://user-images.githubusercontent.com/60260284/82641533-73585000-9c47-11ea-975f-5e21c600df88.png)

pod 'BEMCheckBox'를 추가해주고, pod install을 해주었다. <br>


```Swift
let autoLogincheckBox = BEMCheckBox.init(frame: CGRect.init(x: CGFloat(0), y: CGFloat(0), width: CGFloat(15), height: CGFloat(15)))
```

이후에 autoLoginCheckBox라는 이름으로 BEMCheckBox을 선언해주고 우선 높이,길이를 15정도만 주었다. <br>

#### autoLayout 코드로 잡기

여태껏 storyBoard 메뉴를 통해서 autoLayout을 잡았지만
이번 BEMChecker는 코드를 통해서 생성 해주었기 때문에, 코드를 통해서 AutoLayout을 잡아주어야 한다.

[참고 사이트](https://g-y-e-o-m.tistory.com/58)


```Swift

    func setCheckBox(){
        
        
        
        self.autoLogincheckBox.onAnimationType = BEMAnimationType.fill
        self.autoLogincheckBox.offAnimationType = BEMAnimationType.fill
        
        
        
        self.view.addSubview(self.autoLogincheckBox)
        self.autoLogincheckBox.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraint(NSLayoutConstraint(item: self.autoLogincheckBox, attribute: .top, relatedBy: .equal, toItem: self.passwordTextField, attribute: .bottom, multiplier: 1, constant: 12))
        
        self.view.addConstraint(NSLayoutConstraint(item: self.autoLogincheckBox, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 61))


        
    }
    
```
#### 자동 로그인 
BEMCheckBox에 대해서 AutoLayout을 잡아주었다면, 
자동 로그인 기능을 구현해야 한다.


```Swift
struct UserDefaultKeys{
    static let autoLoginCheck = "isAutoLoginChecked"
    static let token = "token"
}

```

LoginViewController 내에서 UserDefaultKeys라는 구조체를 생성 한 뒤에,

```Swift
            case .success(let token):
                
                if self.autoLogincheckBox.on {
                    UserDefaults.standard.set(true, forKey: UserDefaultKeys.autoLoginCheck)
                }
                
                UserDefaults.standard.set(token, forKey: UserDefaultKeys.token)
                

                guard let tabbarController = tabStoryBoard.instantiateViewController(identifier:
                    "tabBarStoryBoard") as? UITabBarController else { return }

                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)

```

로그인이 성공 했을 때(.success),  UserDefaults를 활용해 데이터를 저장해준다!
로그인 성공시, <code>userDefualtKeys.autoLoginCheck</code> 부분을 true 로 바꾸고 나서,


```Swift
    func autoLoginCheck(){
        if UserDefaults.standard.bool(forKey: UserDefaultKeys.autoLoginCheck) {
            // UserDefaultKeys 가 존재하면 AutoLogin 처리
            
            let tabStoryBoard = UIStoryboard(name: "TableView", bundle: nil) // 탭 스토리 보드 정의
            
            guard let tabbarController = tabStoryBoard.instantiateViewController(identifier:
                  "tabBarStoryBoard") as? UITabBarController else { return }

            
              
              
              tabbarController.modalPresentationStyle = .fullScreen // 풀 스크린으로 모달 띄우기
              self.present(tabbarController, animated: true, completion: nil)
                
        }
    }
```

처음 앱이 실행 되었을때, <code> UserDefaultKeys.autoLoginCheck </code> 값이 true 인지 확인 한뒤에,
true 라면 바로 로그인 완료 화면으로 이동하도록 처리한다!



#### 로그아웃

```Swift
    @IBAction func logoutButton(_ sender: Any) { // 로그아웃
        
        UserDefaults.standard.set(false, forKey: UserDefaultKeys.autoLoginCheck)
        self.dismiss(animated: true, completion: nil)
    }
```

로그아웃 버튼을 눌렀을 때, <code> UserDefaultKeys.autoLoginCheck </code> 부분을 false 로 처리해주고  <br>
dismiss 해주면 완료!