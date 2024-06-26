//
//  UIBarButtonItem+Extension.swift
//  SugarKit
//
//  Created by 游龙 G on 2024/6/26.
//

import UIKit

extension UIBarButtonItem {
    
    /// 根据 title 创建 barButtonItem
    ///
    /// - Parameters:
    ///   - title: title
    ///   - target: Target
    ///   - action: Selector
    convenience init(title: String, color: UIColor, target: Any?, action: Selector) 
    {
        let button = UIButton(sk_title: title, fontSize: 14, color: color, colorHighlighted: UIColor.lightGray)
        button.addTarget(target, action: action, for: .touchUpInside)
        self.init(customView: button)
    }
    
    /// 根据 imgNameNormal/ imgNameHighlighted/ action 创建 barButtonItem
    ///
    /// - Parameters:
    ///   - imgNameNormal: 默认状态图片
    ///   - imgNameHighlighted: 高亮状态图片
    ///   - target: target
    ///   - action: Selector
    convenience init(imgNameNormal: String, imgNameHighlighted: String = "", target: Any?, action: Selector) 
    {
        let button = UIButton() //imageNameNormal: imgNameNormal, imageNameHighlighted: imgNameHighlighted)
        button.setImage(UIImage(named: imgNameNormal), for: .normal)
        if imgNameHighlighted.count > 0 {
            button.setImage(UIImage(named: imgNameHighlighted), for: .highlighted)
        }
        button.addTarget(target, action: action, for: .touchUpInside)
        self.init(customView: button)
    }
    
}
