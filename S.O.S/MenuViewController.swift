//
//  MenuViewController.swift
//  S.O.S
//
//  Created by JHJG on 2016. 7. 29..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBAction func searchClick(sender: AnyObject) {
        print("search")
    }
    @IBAction func schoolSearchClick(sender: AnyObject) {
        print("school search")
    }
    @IBAction func storageClick(sender: AnyObject) {
        print("storage")
    }
    @IBAction func settingClick(sender: AnyObject) {
        print("setting")
    }
    
    @IBAction func cancelClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
