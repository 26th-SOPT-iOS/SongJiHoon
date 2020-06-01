//
//  ViewController.swift
//  uploadSection
//
//  Created by 송지훈 on 2020/05/30.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    
    
    let foods = ["양식","중식","한식","일식"]

    @IBOutlet weak var showPicker: UITextField!
    let picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showPicker?.tintColor = .clear
        createPickerView()
        dismissPickerView()
        picker.delegate = self
        setnavi()
        
        // Do any additional setup after loading the view.
        
        
        
        
        
        
    }
    
    
    
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var contextField: UITextField!
    
    
    @IBAction func addPhoto(_ sender: Any) {
        
        
       // openLibrary()
    }
    
    
    
    @IBAction func addPhotoButton(_ sender: Any) {
        openLibrary()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

          self.view.endEditing(true)

    }

    @IBAction func uploadImage(_ sender: Any) {
        
  
//
//
//        Alamofire.upload(multipartFormData: { (multipartFormData) in
//
//            multipartFormData.append(UIImage(named: "1.png")!.jpegData(compressionQuality: 1)!, withName: "image", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
//
//                    for (key, value) in parameters {
//
//                        multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
//
//                    }
//
//                }, to:"http://127.0.0.1:3000/picture")
//
//                { (result) in
//
//                    switch result {
//
//                    case .success(let upload, _, _):
//
//
//
//                        upload.uploadProgress(closure: { (Progress) in
//
//                            print("Upload Progress: \(Progress.fractionCompleted)")
//
//                        })
//
//
//
//                        upload.responseJSON { response in
//
//                            //self.delegate?.showSuccessAlert()
//
//                            print(response.request)  // original URL request
//
//                            print(response.response) // URL response
//
//                            print(response.data)     // server data
//
//                            print(response.result)   // result of response serialization
//
//                            //                        self.showSuccesAlert()
//
//                            //self.removeImage("frame", fileExtension: "txt")
//
//                            if let JSON = response.result.value {
//
//                                print("JSON: \(JSON)")
//
//                            }
//
//                        }
//
//
//
//                    case .failure(let encodingError):
//
//                        print(encodingError)
//
//                    }
//
//
//
//                }



    }
    

    
    func setnavi(){
        
        
        let backImage = UIImage(named: "btBack")

        
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: backImage, style:.plain, target: nil, action: nil)


        self.navigationController?.navigationBar.barTintColor = UIColor.white // 네비게이션 바 색상 흰색으로 바꾸기
        self.navigationController?.navigationBar.shadowImage = UIImage() // 네비게이션 바 구분 선 지우기

        
        
    }
    
    @IBAction func uploadButton(_ sender: Any) {
        
//        guard let category = showPicker.text else {return}
//        guard let context = contextField.text else {return }
//        
//        
//        
//        
//        
//        
//        
//        
//        UploadService.shared.upload(category: category, imgURL: "", context: context) { networkResult in
//                    switch networkResult {
//                    case .success:
//                        
//        
////                        guard let message = message as? String else { return }
//  
//                        let alertViewController = UIAlertController(title: "회원가입 성공", message: message,
//                                                                    preferredStyle: .alert)
//                        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
//                        alertViewController.addAction(action)
//                        self.present(alertViewController, animated: true, completion: nil)
//        
//        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                    case .requestErr(let message):
//                        guard let message = message as? String else { return }
//                        let alertViewController = UIAlertController(title: "회원가입 실패", message: message,
//                                                                    preferredStyle: .alert)
//                        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
//                        alertViewController.addAction(action)
//                        self.present(alertViewController, animated: true, completion: nil)
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                        
//                    case .pathErr:
//                        self.showAlertViewController(message:" 사용자 입력 오류 ")
//                        
//                    case .serverErr:
//                        self.showAlertViewController(message: "서버 오류")
//                        
//                    case .networkFail:
//                        self.showAlertViewController(message: "네트워크 오류")
//                    }
//                }
        
    }
    
    func showAlertViewController(message : String){
        let alertViewController = UIAlertController(title: "오류", message: message,
                                                    preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true, completion: nil)

        
    }
    
    

    
}



extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
               
        
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            print(image)
            imageView?.image = image
            self.view.setNeedsLayout()

            
        }
        dismiss(animated: true, completion: nil)

    }
    
    func openLibrary(){
        print("open Library")
        self.picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
        
        
    }
}


extension ViewController:UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    


    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return foods.count
    }

    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return foods[row]
    }


    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        showPicker.text = foods[row]
    }


    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        showPicker?.inputView = pickerView
    }

    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "선택", style: .plain,     target: self, action:#selector(dismissKeyboard) )
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        showPicker?.inputAccessoryView = toolBar
    }
    
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    

}
