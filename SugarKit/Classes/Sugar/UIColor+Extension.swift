//
//  UIColor+Extension.swift
//  SKSugarSwiftExample
//
//  Created by Sky on 2020/6/8.
//  Copyright © 2020 Sky. All rights reserved.
//

import UIKit

public extension UIColor {
    
    class func random() -> UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(256)) / 255.0, 
                       green: CGFloat(arc4random_uniform(256)) / 255.0, 
                       blue: CGFloat(arc4random_uniform(256)) / 255.0, 
                       alpha: 1.0)
    }
    
    /// 根据 r/g/b 的数值创建 UIColor  
    ///
    /// - Parameters:
    ///   - r: red
    ///   - g: green
    ///   - b: blue
    ///   - alpna: alpha
    convenience init(sk_red: CGFloat, sk_green: CGFloat, sk_blue: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: sk_red / 255.0, green: sk_green / 255.0, blue: sk_blue / 255.0, alpha: 1.0)
    }
    
    /// 根据 16进制 颜色创建 UIColor 对象 
    ///
    /// - Parameter hex: 16进制颜色 - 0xFFFFFF
    convenience init(hex: Int32, alpha: CGFloat = 1.0) {
        self.init(
            red:    CGFloat((hex & 0xFF0000) >> 16) / 255.0, 
            green:  CGFloat((hex & 0x00FF00) >> 8)  / 255.0, 
            blue:   CGFloat(hex & 0x0000FF) / 255.0, 
            alpha:  alpha
        )
    }

    convenience init(hexStr: String, alpha: CGFloat = 1.0) {
        var str = hexStr.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased() //uppercased
        if str.hasPrefix("0X") { str = String(str.suffix(from: str.index(str.startIndex, offsetBy: 2))) }
        if str.hasPrefix("#") { str = String(str.suffix(from: str.index(str.startIndex, offsetBy: 1))) }
        
        if str.count != 6 { self.init(red: 0, green: 0, blue: 0, alpha: 1) } //默认为黑色
        
        // 转换
        
        var r: UInt64 = 0, g: UInt64 = 0, b: UInt64 = 0
        _ = Scanner(string: String(str.prefix(2))).scanHexInt64(&r)
        _ = Scanner(string: String(str[str.index(str.startIndex, offsetBy: 2) ..< str.index(str.startIndex, offsetBy: 4)])).scanHexInt64(&g)
        _ = Scanner(string: String(str[str.index(str.startIndex, offsetBy: 4) ..< str.index(str.startIndex, offsetBy: 6)])).scanHexInt64(&b)
        
        self.init(
            red: CGFloat(r) / 255.0, 
            green: CGFloat(g) / 255.0, 
            blue: CGFloat(b) / 255.0, 
            alpha: alpha
        )
    }
}


public extension UIColor {
    
    /// skyBlue: 0x66ccff
    class var skyBlue: UIColor { UIColor(hex: 0x66ccff) }
    
    /// 118, 166, 248
    class var system_Blue: UIColor { UIColor(red: 118, green: 166, blue: 248, alpha: 1) }
    
    
    /// 森林绿 34, 139, 34
    class var forestGreen: UIColor {
        return UIColor(red: 34.0 / 255.0, 
                       green: 139.0 / 255.0, 
                       blue: 34.0 / 255.0, 
                       alpha: 1.0)
    }
    
    /// 草绿色 153, 204, 51
    class var grassGreen: UIColor {
        return UIColor(red: 153.0 / 255.0, 
                       green: 204.0 / 255.0, 
                       blue: 51.0 / 255.0, 
                       alpha: 1.0)
    }
    
}








