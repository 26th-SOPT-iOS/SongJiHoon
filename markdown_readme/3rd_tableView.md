

# TableView를 이용해 친구목록 만들기

[이동하기](https://github.com/26th-SOPT-iOS/SongJiHoon/tree/master/3rd_week/SOPT_thirdWeek_assignment_friendTableView%20%EB%B3%B5%EC%82%AC%EB%B3%B8)
___
- 사용 개념 : Tab Bar Controller, TableView

(과제 결과물) <br>
![May-14-2020 19-04-47 (1)](https://user-images.githubusercontent.com/60260284/81924360-fbbc6c80-9619-11ea-8179-c3c27eae086a.gif)


___

##  Tab Bar 아이콘 색 변경


초기에 아이콘 색상이 푸른색으로 되어 있어서, zeplin에서 요구하는 색으로 바꾸기 위해
StoryBoard 내에서 Tab Bar Controller > Tab Bar 에서 

<img width="259" alt="스크린샷 2020-05-14 오후 7 18 47" src="https://user-images.githubusercontent.com/60260284/81922883-bd25b280-9617-11ea-8ff9-c04985f0963f.png">

tintColor 속성을 검은색으로 변경하니 <br>
<img width="376" alt="스크린샷 2020-05-14 오후 7 19 30" src="https://user-images.githubusercontent.com/60260284/81922943-d9c1ea80-9617-11ea-8813-fae107d3e653.png"> <br>
성공적으로 변했다!

___

## 한 테이블 뷰에서 섹션 나누기


<img width="301" alt="스크린샷 2020-05-14 오후 7 20 51" src="https://user-images.githubusercontent.com/60260284/81923056-0970f280-9618-11ea-8db6-985e768d84e0.png">

세미나에서 배운 것처럼 테이블뷰를 설정 한 뒤에, 그 안에 myProfileCell,userProfileCell 
따로 identifier 을 설정해서 나누어 주었다.

내 프로필을 나타내는 셀의 넓이와 친구들 프로필을 나타내는 셀의 넓이가 동일하지 않기 때문!<br>

```Swift
let sections : [String] = ["Me","Friends"]
```
	

처럼 섹션을 구분해주고,

```Swift
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 1
        { // 이 섹션에 해당하는 셀의 코드를 작성
        }
    }
```


로 각 함수 내에서 section으로 구분을 해주었다!

___

###  header 배경색 및 폰트 설정


```Swift
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) { // 여기서 헤더 속성 변경
        if section == 1 {
            view.tintColor = .white // 배경색 흰색으로 바꾸기

            let header = view as! UITableViewHeaderFooterView
      
            header.textLabel?.textColor = .lightGray
            header.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 11)
        }

    }
```

<code>willDisplayHeaderView</code> 부분에서 헤더 부분을 설정 해준다!


___
### 밀어서 친구 목록 삭제하기
```Swift
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if tableView == friendTableView {
	        if indexPath.section == 1{
	            if editingStyle == UITableViewCell.EditingStyle.delete {
	                 friendCollection.remove(at: indexPath.row)
	                 tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
                
	                tableView.reloadData()             
                
            }
        }


    }
```

<code> UITableViewCell.EditingStyle.delete </code> 부분을 활용해서 친구 목록을 삭제하고 <br>
<code> tableView.reloadData() </code>부분을 통해서 헤더에 나타내고 있는 친구 수에 대한 변수를 다시 나타내야 한다!<br>
(친구 목록 삭제 했을 때, 줄어드는 것을 보기 위함)

<br>
<br>

___
### 설정버튼 눌렀을때 Action Sheet 나오게 만들기

```Swift
    
    @IBAction func setting(_ sender: Any) {
        
        let slideUpMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        
        
        let friendAction = UIAlertAction(title: "친구 관리", style: .default, handler: {
            (alert:UIAlertAction!) -> Void in
        })
        let settingAction = UIAlertAction(title: "전체 설정", style: .default, handler: {
            (alert:UIAlertAction!) -> Void in
        })
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: {
            (alert:UIAlertAction!) -> Void in
        })
        
        slideUpMenu.addAction(friendAction)
        slideUpMenu.addAction(settingAction)
        slideUpMenu.addAction(cancelAction)
        
        self.present(slideUpMenu, animated: true, completion: nil)

        
        
        
    }

```

기본 UI 중에서 actionsheet 를 활용해서 <code> UIAlertAction </code> 를 생성 한 뒤,
<code> present </code> 에 <code> UIAlertController </code> 를 넣어줘서 메뉴가 올라오도록 한다!

<img width="365" alt="스크린샷 2020-05-14 오후 7 33 15" src="https://user-images.githubusercontent.com/60260284/81924206-c3b52980-9619-11ea-8ba9-68011d2330cc.png">

(적용 결과)⠀
