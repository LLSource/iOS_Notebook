//
//  UIColor_bbsColor.swift
//  BBS
//
//  Created by li’Pro on 2018/4/24.
//  Copyright © 2018年 wzl. All rights reserved.
//

import UIKit


extension UIColor {
    class func bbsBackground() -> UIColor{
        return UIColor.bbsWhite()
    }
    
    class func bbsBlack() -> UIColor{
        return UIColor(red:51/255.0, green:51/255.0 ,blue:51/255.0 , alpha:1.00)
    }
    class func bbsWhite() -> UIColor{
        return UIColor(hex: 0xFFFFFF)
    }
    class func bbsRed() -> UIColor{
        return UIColor(hex: 0xdd0000)
    }
    class func A4() -> UIColor{
        return UIColor(hex: 0xA4A4A4)
    }
    class func AD() -> UIColor{
        return UIColor(hex: 0xADADAD)
    }
    
    class func F2() -> UIColor{
        return UIColor(hex: 0xf2f2f2)
    }
    
    class func DE() -> UIColor{
        return UIColor(hex: 0xdedede)
    }
    class func EE() -> UIColor{
        return UIColor(hex: 0xeeeeee)
    }
    
    
    convenience init(hex: Int) {
        self.init(hex: hex, alpha: 1.0)
    }
    convenience init(hex: Int, alpha: CGFloat) {
        let red   = CGFloat((hex >> 16) & 0xFF) / 255.0
        let green = CGFloat((hex >> 8) & 0xFF) / 255.0
        let blue  = CGFloat(hex & 0xFF) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}











