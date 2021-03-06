//
//  RecentTableViewController.swift
//  S.O.S
//
//  Created by JHJG on 2016. 7. 28..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class RecentTableViewController: UITableViewController,UIPopoverPresentationControllerDelegate {
    
    var popupController:UIAlertController?
    var okAction:UIAlertAction?
    var cancelAction:UIAlertAction?
    
    var menuKey:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //네비게이션 초기화
        naviInit()
        
        //테이블 뷰의 예상 행 높이를 설정한다.(성능향상 및 내비게이션이 추가될때 행 높이와 충돌하지 않도록 함)
        tableView.estimatedRowHeight = 60
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //섹션갯수
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //섹션 별 테이블 아이템 갯수
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //재활용할 셀이 큐에 있으면 dequeue하고 없으면 셀을 만든다.
        let cell = self.tableView.dequeueReusableCellWithIdentifier(SupportSingleton.sharedInstance.RECENT_CELL_ID, forIndexPath: indexPath) as! RecentTableViewCell
        let row = indexPath.row
        
        //텍스트 테스트
        cell.title.text = "셀제목입니다 셀제목입니다 셀제목입니다 셀제목입니다 셀제목입니다 셀제목입니다 \(row)"
        cell.date.text = "2016.05.28 ~ 2016.11.04"
        
        return cell
    }
    
    
    //셀 슬라이드를 하기위해 필요
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        //유니코드로 u{2606} = 별모양 
        //별 색깔 변하게 하기 : u{2605}
        let save = UITableViewRowAction(style: .Normal, title: "\u{2606}\n저장") { action, index in
            print("save button tapped")
            self.startConfirmPopup("보관함 추가",message: "보관함에 추가 하시겠습니까?")
        }
        save.backgroundColor = UIColor.mainColor()
        return [save]
    }
    
    //셀 슬라이드를 하기위해 필요
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }
    
    //세그웨이가 실행되기 전에 호출됨.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //팝오버 관련해서 필요함
        //메뉴버튼 눌렀을때
        if segue.identifier == SupportSingleton.sharedInstance.MENU_SEGUE_ID{
            let popoverViewController = segue.destinationViewController as! MenuViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            //현재 뷰컨트롤러 객체를 넣어준다.
            popoverViewController.recentViewController = self
            popoverViewController.popoverPresentationController!.delegate = self
        }
        
        //디테일 뷰로 이동
        if segue.identifier == SupportSingleton.sharedInstance.DETAIL_SEGUE_ID{
            //목적지 ViewController를 선언해주고
            let detailViewController = segue.destinationViewController as! DetailViewController
            
            //현재 선택된 열의 indexPath를 알아낸다.
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            
            print("row \(row)")
            //목적지 viewController에서 website 변수를 채운다.
//            detailViewController.webSite = webAddresses[row]
            
        }
    }
    
    //팝오버해서 관련 필요함
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    //네비게이션 초기화
    func naviInit(){
        //네비게이션 전체 색 변경
        self.navigationController?.navigationBar.barTintColor = UIColor.mainColor()
        //백 버튼쪽 색 변경
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        //네비게이션 title과 색 변경
        self.title = "최근 장학금"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
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
    
    //메뉴를 클릭한 경우 실행
    func menuClick(){
        var viewController:UIViewController?
        if menuKey == SupportSingleton.sharedInstance.MENU_SEARCH_KEY {
            //뷰 컨트롤러 Identifier로 스토리보드 내용 가져와서 뷰컨트롤러를 채운다
            viewController = self.storyboard!.instantiateViewControllerWithIdentifier(SupportSingleton.sharedInstance.SEARCHSTORYBOARD_ID) as! SearchViewController
        } else if menuKey == SupportSingleton.sharedInstance.MENU_SCHOOLSEARCH_KEY {
            viewController = self.storyboard!.instantiateViewControllerWithIdentifier(SupportSingleton.sharedInstance.SCHOOLSEARCHSTORYBOARD_ID) as! SchoolSearchViewController
        } else if menuKey == SupportSingleton.sharedInstance.MENU_STORAGE_KEY {
            viewController = self.storyboard!.instantiateViewControllerWithIdentifier(SupportSingleton.sharedInstance.STORAGESTORYBOARD_ID) as! StorageViewController
        } else if menuKey == SupportSingleton.sharedInstance.MENU_SETTING_KEY {
            viewController = self.storyboard!.instantiateViewControllerWithIdentifier(SupportSingleton.sharedInstance.STETTINGSTORYBOARD_ID) as! SettingViewController
        } else {
            return
        }
        //뷰를 바꾼다.
        self.navigationController!.pushViewController(viewController!, animated: true)
    }
    
    
}
