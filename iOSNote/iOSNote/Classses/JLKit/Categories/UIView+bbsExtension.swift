//
//  UIView+bbsExtension.swift
//  BBS
//
//  Created by li’Pro on 2018/5/23.
//  Copyright © 2018年 wzl. All rights reserved.
//

import UIKit

/// view 添加等待指示器
private var viewIndicatorKey: UInt8 = 0

extension UIView {
    func startIndicatorAnimation() {
        var indicator: UIActivityIndicatorView? = objc_getAssociatedObject(self, &viewIndicatorKey) as? UIActivityIndicatorView
        if indicator == nil {
            indicator = {
                let v = UIActivityIndicatorView(activityIndicatorStyle: .white)
                v.hidesWhenStopped = true
                return v
            }()
            objc_setAssociatedObject(self, &viewIndicatorKey, indicator, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            // add to view
            addSubview(indicator!)
            _ = indicator?.mas_makeConstraints({ (make) in
                make?.center.equalTo()(self)
            })
        }
        bringSubview(toFront: indicator!)
        indicator?.startAnimating()
    }
    func stopIndicatorAnimation() {
        let indicator = objc_getAssociatedObject(self, &viewIndicatorKey) as? UIActivityIndicatorView
        if indicator != nil {
            indicator?.stopAnimating()
//            indicator?.removeFromSuperview()
        }
    }
}
