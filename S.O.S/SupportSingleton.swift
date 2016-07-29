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
    let DETAIL_SEGUE_ID:String = "ShowDetailsSegue"
    let MENU_SEGUE_ID:String = "menuSegue"
    
    
    
    static let sharedInstance = SupportSingleton()
    
    init() {
    }
    
    

    
}