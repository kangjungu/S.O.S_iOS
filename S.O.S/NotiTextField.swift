//
//  NotiTextField.swift
//  S.O.S
//
//  Created by JHJG on 2016. 7. 27..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class NotiTextField: UITextField {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.borderColor = UIColor.mainColor().CGColor
    }
}
