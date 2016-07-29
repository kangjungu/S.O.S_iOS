//
//  ViewController.swift
//  S.O.S
//
//  Created by JHJG on 2016. 7. 27..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class NotiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //navigation 초기화
        naviInit()
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //네비게이션 초기화
    func naviInit(){
        //네비게이션 전체 색 변경
        self.navigationController?.navigationBar.barTintColor = UIColor.mainColor()
        //백 버튼쪽 색 변경
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        //네비게이션 title과 색 변경
        self.title = "개인정보 등록"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    }


}

