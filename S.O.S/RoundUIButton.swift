//
//  RoundUIButton.swift
//  S.O.S
//
//  Created by JHJG on 2016. 7. 27..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class RoundUIButton: UIButton {

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        self.frame = CGRectMake(160, 100, 50, 50)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
    }

}
