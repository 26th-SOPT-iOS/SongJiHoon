

# auto Layout 을 활용한 계산기 만들기

[이동하기](https://github.com/26th-SOPT-iOS/SongJiHoon/tree/master/2nd_week/SOPT_secondWeek_assignment_2)

##  IBOutlet Collection 활용하기


<img src="https://user-images.githubusercontent.com/60260284/81264885-22f4c600-907d-11ea-802f-fd37ef0adc5a.png"" width="%" height = "">

<img src="https://user-images.githubusercontent.com/60260284/81267172-fcd12500-9080-11ea-827d-e9b5fe358234.png" width="40%" height = "">

여러개의 outlet을 같은 그룹으로 묶을 때 (타 언어에서 배열 개념처럼) IBOutlet Collection을 활용한다.
스토리보드 내에 있는 버튼을 코드로 끌어당겨서 connection을 Outlet Collection 으로 바꿔준다
그리고 같이 묶고 싶은 버튼들을 Collection에 모두 넣어준다!




___
### 버튼 둥글게 만들기

```Swift
    
func setButton(){
     
    for button in uiButton{
        button.layer.cornerRadius = 0.5 * button.layer.bounds.size.width 
    }

```

uiButton 이라는 Collection 내에 있는 모든 버튼에 대해서 반복문을 사용해서 깎아준다

그냥 radius를 깎아주게 되면.. 반달모양처럼 이상하게 깎이는 모습을 볼 수 있다.

<code> bounds.size.width </code> 의 절반만큼을 Radius 로 깎아준다.



