//
//  PersonalViewController.swift
//  S.O.S
//
//  Created by JHJG on 2016. 7. 27..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class PersonalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        //네비게이션 컨트롤러 숨기기
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        //네비게이션 컨트롤러 나타내기
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
