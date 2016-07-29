//
//  SupportSigleton.swift
//  S.O.S
//
//  Created by JHJG on 2016. 7. 28..
//  Copyright © 2016년 KangJungu. All rights reserved.
//
import UIKit

class SupportSingleton {
    
    let RECENT_CELL_ID:String = "RECENT_CELL"
    let SEARCH_CELL_ID:String = "KEYWORD_CELL"
    
    let DETAIL_SEGUE_ID:String = "ShowDetailsSegue"
    let SEARCH_DETAIL_SEGUE_ID:String = "SearchShowDetailsSegue"
    let MENU_SEGUE_ID:String = "menuSegue"
    
    let SEARCHSTORYBOARD_ID = "SEARCHVIEWCONTROLLER"
    let SCHOOLSEARCHSTORYBOARD_ID = "SCHOOLSEARCHVIEWCONTROLLER"
    let STORAGESTORYBOARD_ID = "STORAGEVIEWCONTROLLER"
    let STETTINGSTORYBOARD_ID = "SETTINGVIEWCONTROLLER"
    
    let MENU_SEARCH_KEY:Int = 1
    let MENU_SCHOOLSEARCH_KEY:Int = 2
    let MENU_STORAGE_KEY:Int = 3
    let MENU_SETTING_KEY:Int = 4
    
    static let sharedInstance = SupportSingleton()
    
    init() {
    }
    
    

    
}