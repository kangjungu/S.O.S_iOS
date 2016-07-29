//
//  MenuViewController.swift
//  S.O.S
//
//  Created by JHJG on 2016. 7. 29..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    weak var recentViewController: RecentTableViewController?
    
    @IBAction func searchClick(sender: AnyObject) {
        recentViewController?.menuKey = SupportSingleton.sharedInstance.MENU_SEARCH_KEY
        dismissViewController()
        recentViewController?.menuClick()
    }
    @IBAction func schoolSearchClick(sender: AnyObject) {
        recentViewController?.menuKey = SupportSingleton.sharedInstance.MENU_SCHOOLSEARCH_KEY
        dismissViewController()
        recentViewController?.menuClick()
    }
    @IBAction func storageClick(sender: AnyObject) {
        recentViewController?.menuKey = SupportSingleton.sharedInstance.MENU_STORAGE_KEY
        dismissViewController()
        recentViewController?.menuClick()
    }
    
    @IBAction func settingClick(sender: AnyObject) {
        recentViewController?.menuKey = SupportSingleton.sharedInstance.MENU_SETTING_KEY
        dismissViewController()
        recentViewController?.menuClick()
    }
    
    @IBAction func cancelClick(sender: AnyObject) {
        dismissViewController()
    }
    
    //뷰 컨트롤러 삭제
    func dismissViewController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
