//
//  SecondViewController.swift
//  SOPT_firstWeek_Seminar_exercise
//
//  Created by 송지훈 on 2020/04/23.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    
    var name: String?
    var email: String?
    var isOnOff: Bool?
    var frequency: Float?
    
    
    
    @IBOutlet weak var namelb: UILabel!
    
    @IBOutlet weak var emaillb: UILabel!
    

    @IBOutlet weak var switchlb: UILabel!
    
    @IBOutlet weak var frequencylb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()

        // Do any additional setup after loading the view.
    }
    
    
    
    private func setLabels(){
        
        
        guard let name = self.name else {return}
        guard let email = self.email else {return}
        guard let isOnOff = self.isOnOff else {return}
        guard let frequency = self.frequency else {return}
        
        namelb.text = name
        emaillb.text = email
        switchlb.text = isOnOff ? "On" : "Off"
        frequencylb.text = "\(frequency)"
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backScreen(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
