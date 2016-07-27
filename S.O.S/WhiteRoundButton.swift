//
//  RoundButton.swift
//  S.O.S
//
//  Created by JHJG on 2016. 7. 27..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class WhiteRoundButton: UIButton {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 20.0;
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 1.5
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.setTitleColor(UIColor.mainColor(), forState: UIControlState.Normal)
        self.backgroundColor = UIColor.whiteColor()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.backgroundColor = UIColor.clearColor()
    }
    
    
    
}

//UIColor extend
extension UIColor
{

    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    //16진수로 컬러 변환 해주는 init
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
    
    //메인 컬러 16진수로 리턴
    class func mainColor() -> UIColor
    {
        return UIColor(netHex: 0x00c18b)
    }
    
}