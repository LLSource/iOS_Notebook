//
//  BigHitButton.swift
//  BBS
//
//  Created by li’Pro on 2018/5/15.
//  Copyright © 2018年 wzl. All rights reserved.
//

import UIKit

class BigHitButton: UIButton {

    
    //MARK: 默认上下左右扩大 6 pt
    var extendInset = UIEdgeInsetsMake(6, 6, 6, 6)
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var frame = self.bounds;
        frame.origin.x -= extendInset.left
        frame.origin.y -= extendInset.top
        frame.size.width += (extendInset.left + extendInset.right)
        frame.size.height += (extendInset.top + extendInset.bottom)
        
        return frame.contains(point)
    }

}
