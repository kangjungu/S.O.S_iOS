//
//  MainColorRoundButton.swift
//  S.O.S
//
//  Created by JHJG on 2016. 7. 27..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class MainColorRoundButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 15.0;
        self.layer.borderColor = UIColor.mainColor().CGColor
        self.layer.borderWidth = 1.5
        self.backgroundColor = UIColor.mainColor()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.setTitleColor(UIColor.mainColor(), forState: UIControlState.Normal)
        self.backgroundColor = UIColor.whiteColor()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.backgroundColor = UIColor.mainColor()
    }
    
}
