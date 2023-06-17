//
//  UIResponder+Extension.swift
//  SKSugarSwiftExample
//
//  Created by Sky on 2021/3/31.
//  Copyright © 2021 Sky. All rights reserved.
//

import UIKit


private weak var sk_firstResponder: AnyObject? 

public extension UIResponder {
    
    static func sk_getFirstResponder() -> AnyObject? {
        sk_firstResponder = nil
        UIApplication.shared.sendAction(#selector(onFindFirstResponder), to: nil, from: nil, for: nil)
        return sk_firstResponder
    }
    
    @objc private func onFindFirstResponder() {
        sk_firstResponder = self
    }
    
    
    static func sk_resignFirstResponder() {
        UIApplication.shared.sendAction(#selector(resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


