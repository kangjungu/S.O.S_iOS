//
//  Utils.swift
//  S.O.S
//
//  Created by JHJG on 2016. 7. 27..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    class func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}