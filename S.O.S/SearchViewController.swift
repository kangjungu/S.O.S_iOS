//
//  SearchViewController.swift
//  S.O.S
//
//  Created by JHJG on 2016. 7. 29..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
    
    @IBOutlet var searchText: UISearchBar!
    @IBOutlet var tableView: UITableView!
    let cellID = SupportSingleton.sharedInstance.SEARCH_CELL_ID
    
    var popupController:UIAlertController?
    var okAction:UIAlertAction?
    var cancelAction:UIAlertAction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviInit()
        
        //search bar에서 search 버튼을 누른경우를 처리하려면 델리게이트를 추가해준다.
        searchText.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        //테이블 뷰의 예상 행 높이를 설정한다.(성능향상 및 내비게이션이 추가될때 행 높이와 충돌하지 않도록 함)
        tableView.estimatedRowHeight = 60
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //섹션갯수
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //섹션 별 테이블 아이템 갯수
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //재활용할 셀이 큐에 있으면 dequeue하고 없으면 셀을 만든다.
        let cell = self.tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! RecentTableViewCell
        let row = indexPath.row
        
        //텍스트 테스트
        cell.title.text = "셀제목입니다 셀제목입니다 셀제목입니다 셀제목입니다 셀제목입니다 셀제목입니다 \(row)"
        cell.date.text = "2016.05.28 ~ 2016.11.04"
        
        return cell
    }
    
    //셀 슬라이드를 하기위해 필요
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        //유니코드로 u{2606} = 별모양
        //별 색깔 변하게 하기 : u{2605}
        let save = UITableViewRowAction(style: .Normal, title: "\u{2606}\n저장") { action, index in
            print("save button tapped")
            self.startConfirmPopup("보관함 추가",message: "보관함에 추가 하시겠습니까?")
        }
        save.backgroundColor = UIColor.mainColor()
        return [save]
    }
    
    //셀 높이 선언
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    //셀 슬라이드를 하기위해 필요
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }

    //스크롤 시작시 키보드 숨기기
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        searchText.endEditing(true)
    }
    
    //search 버튼 클릭시 이 메소드 호출됨.
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        //검색 구현
        print("searchBarSearchButtonClicked")
        //키보드 숨김
        searchText.endEditing(true)
    }
    
    //세그웨이가 실행되기 전에 호출됨.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //디테일 뷰로 이동
        if segue.identifier == SupportSingleton.sharedInstance.SEARCH_DETAIL_SEGUE_ID{
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
    
    
    //네비게이션 초기화
    func naviInit(){
        //네비게이션 title과 색 변경
        self.title = "키워드 검색"
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
