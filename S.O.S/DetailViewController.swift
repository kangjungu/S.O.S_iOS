//
//  DetailViewController.swift
//  S.O.S
//
//  Created by JHJG on 2016. 7. 29..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var popupController:UIAlertController?
    var okAction:UIAlertAction?
    var cancelAction:UIAlertAction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //네비게이션 초기화
        naviInit()
       
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
    
    func storageButtonClick(sender: UIBarButtonItem) {
        print("storageButtonClick")
        //별 색깔도 변경하기 
        startConfirmPopup("보관함 추가",message: "보관함에 추가 하시겠습니까?")
    }
    
    func startConfirmPopup(title:String,message:String){
        
        popupController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .Alert)
        
        okAction = UIAlertAction(title: "확인", style: .Default, handler: { (alertAction) in
            //보관함 추가
            print("확인")
            self.startCompletePopup()
        })
        cancelAction = UIAlertAction(title: "취소", style: .Cancel, handler: nil)
        
        popupController?.addAction(okAction!)
        popupController?.addAction(cancelAction!)
        
        self.presentViewController(
            popupController!,
            animated: true,
            completion: nil)
        
    }
    
    func startCompletePopup(){
        popupController = UIAlertController(
            title: "보관함 추가",
            message: "보관함에 추가되었습니다.",
            preferredStyle: .Alert)
        
        okAction = UIAlertAction(title: "확인", style: .Cancel, handler: nil)
        
        popupController?.addAction(okAction!)
        
        self.presentViewController(
            popupController!,
            animated: true,
            completion: nil)
    }
    
}
