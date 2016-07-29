//
//  DetailViewController.swift
//  S.O.S
//
//  Created by JHJG on 2016. 7. 29..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //네비게이션 초기화
    func naviInit(){
        //네비게이션 title과 색 변경
        self.title = "장학금 세부 내용"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        //보관함 버튼 선언
        let storageButton = UIBarButtonItem(
            title: "\u{2606}",
            style: .Plain,
            target: self,
            action: #selector(DetailViewController.storageButtonClick(_:))
        )
        
        self.navigationItem.rightBarButtonItem = storageButton
        
    }
    
    override func viewWillAppear(animated: Bool) {
        naviInit()
    }
    
    override func viewWillDisappear(animated: Bool) {
        
    }
    
    func storageButtonClick(sender: UIBarButtonItem) {
        print("storageButtonClick")
        //별 색깔도 변경하기 
    }
    
}
