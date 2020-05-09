

# scrollView 를 활용한 Login Form 만들기

[이동하기](https://github.com/26th-SOPT-iOS/SongJiHoon/tree/master/2nd_week/SOPT_secondWeek_assignment_1)

##  ID/PW Text Field 설정


처음에 TextField.layer 에서 <code> emailTextField.layer.cornerRadius </code> 처럼 값을 주었는데 
테두리가 둥글게 변하지 않는 현상을 발견했다.
-> textField 에서 bounds를 제거하니까 되더라...


하지만, radius 를 적용하고 나니,
<img width="352" alt="padding 적용 전" src="https://user-images.githubusercontent.com/60260284/81268795-5e928e80-9083-11ea-9516-290afa688709.png">

사용자로부터 input을 받았을 때, 왼쪽으로 값이 붙어버려 가독성이 떨어지는 현상이 일어난다.
그래서 

```Swift

extension UITextField{
    
	 func addLeftPadding() {
        let padding = UIView(frame: CGRect(x:0, y:0, width:18, height:self.frame.height)) // set padding in UITextField
        self.leftView = padding
        self.leftViewMode = ViewMode.always
    }
}


```
UITextField 에서 addLeftPadding 이라는 함수를 따로 커스텀.

텍스트 필드 좌측에 padding 값을 살짝 주어서 가독성을 좋게 만들었다!⠀

(적용 후 모습)
<img width="375" alt="padding 적용 후" src="https://user-images.githubusercontent.com/60260284/81269169-ea0c1f80-9083-11ea-9d0c-7aadf6d8f684.png">



___
### 회원가입 Label Action 만들기


<img width="272" alt="밑줄" src="https://user-images.githubusercontent.com/60260284/81269495-5850e200-9084-11ea-814a-5834cb0ed56b.png">

다음과 같이 "회원가입 하기"라는 label에 밑줄을 넣고, 저 라벨을 누르면 회원가입 창으로 이동을 해야 한다.

우선 밑줄을 넣기 위해서 storyboard 내에 있는 속성을 수정했다.


<img width="" alt="밑줄" src="https://user-images.githubusercontent.com/60260284/81269577-774f7400-9084-11ea-936e-dc52dd2515b7.png">

text 의 속성을 Plain 에서 Attributed으로 변경 후, Font>Underline 을 설정해서 밑줄을 넣었다.


일반 UILabel 객체는 IBAction을 넣을수가 없었다!
그래서 따로 클릭 했을 때의 함수를 지정 해 주었다...



```Swift
    
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer){
        
        guard let nextView = self.storyboard?.instantiateViewController(identifier: "signupViewController") else {return}
        
        
        
        self.navigationController?.pushViewController(nextView, animated: true)
        
    
    }
    
    
    func setLabel(){
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        
        self.signupButton.isUserInteractionEnabled = true
        self.signupButton.addGestureRecognizer(labelTap)
        
        
        
    }
    
```

setLabel 이라는 함수를 지정해서 ViewdidLoad() 밑에 넣어 주었고,

<code> labelTap </code> 상수를 선언해서 <code> UITabGestureRecognizer</code>를 활용해 action 을 추가했다.
여기서의 action 은 회원가입 view controller로 넘어갈 수 있도록 push 이벤트를 지정해두었다.
( <code> @objc func labelTapped </code> ) 이 부분 !


___
네비게이션 상단 바의 색 속성을 바꾸기 위해서
<code>        navigationController?.navigationBar.barTintColor = UIColor.white        // navigation bar color change </code> 를 활용했다!!


___

### scroll Action

대망의 스크롤 액션 부분 🙂
여기서 대부분의 시간을 삽질하고.. 날려먹었다...😢

<img width="352" alt="scroll Action" src="https://user-images.githubusercontent.com/60260284/81270990-7881a080-9086-11ea-8cd1-da0962896d6a.gif">



우선
ViewDidLoad() 내에

```Swift

self.scrollView.delegate = self
self.scrollView.contentInsetAdjustmentBehavior = .never

```

scrollView에 대한 delegate을 지정해주고,
<code> contentInsetAdjustmentBehavior</code> 에서 .never 라는 속성을 지정해줘서 safe Area 까지 
ImageView가 올라오도록 설정해준다!



##### scroll 인식해서 상단 이미지 뷰에 대한 height 늘려주기

```Swift

extension ScrollViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        



        let y :CGFloat = scrollView.contentOffset.y
 
        if y < 0 {
            heightConstraint.constant = 210 - y
            
        }else{
            
            var height = 210 - y
            height = height > 88 ? height : 88
            heightConstraint.constant = height
            
        }

        
    }
}

```
스크롤을 위로 올릴 때,
<code> scrollView.contentOffSet.y </code> 값은 음수로 점점 더 작아지고,
스크롤을 아래로 내리면 
<code> scrollView.contentOffSet.y </code> 값은 양수로 점점 더 커진다!

움직인 값만큼 상단 imageView 에 대한 height를 늘려줘야 하기에
<code> heightConstraint.constant = 210 - y </code> 로 넣어주게 되면
기본 이미지 높이값(210) 에 위로 드래그 한 만큼(y) 더해진 값이 뷰에 나타나게 된다!



StoryBoard 내에서 AutoLayout을 상위 뷰하고 constraint 잡아서 하는 방법도 있다!
[Stretchy-Header-참고-사이트](https://lifetimecoding.wordpress.com/2016/01/09/ios-%E1%84%8B%E1%85%A9%E1%84%90%E1%85%A9-%E1%84%85%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%8B%E1%85%A1%E1%84%8B%E1%85%AE%E1%86%BA-%E1%84%89%E1%85%B3%E1%84%90%E1%85%B3%E1%84%85%E1%85%A2%E1%84%8E%E1%85%B5/)


이 부분은 아직 많이 익숙하지 않아서 많이 해봐야 알 것 같다...😢
