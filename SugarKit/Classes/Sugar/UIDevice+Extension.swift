//
//  UIDevice+Extension.swift
//  SugarKit
//
//  Created by 游龙 G on 2024/6/26.
//

import UIKit

extension UIDevice {
    
    @objc class var systemVersionF: Float {
        let temp = UIDevice.current.systemVersion
        let arr = temp.components(separatedBy: ".")
        var version = arr[0]
        if arr.count > 0 {
            version += "." + arr[1]
        }
        
        return Float(version) ?? 0
    }  
    
    
}

