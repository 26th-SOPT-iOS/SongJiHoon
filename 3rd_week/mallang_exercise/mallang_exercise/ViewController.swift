//
//  ViewController.swift
//  mallang_exercise
//
//  Created by 송지훈 on 2020/05/09.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var drinks : [String] = ["소주","맥주","보드카","고량주","와인","데킬라","진","럼"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pickerView.delegate = self
        
        // Do any additional setup after loading the view.
    }


}




extension ViewController : UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        return self.drinks[row]
        
    }
    
    
}


extension ViewController : UIPickerViewDataSource{
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return self.drinks.count
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    
}
