//
//  AppHelper.swift
//  SugarKit
//
//  Created by YouLong on 2023/6/18.
//

import UIKit


class AppHelper {
    
    class func getKeyWindow() -> UIWindow {
        var kwindow: UIWindow? = nil
        if UIApplication.shared.delegate!.responds(to: NSSelectorFromString("window")) {
            let theKeyWindow = UIApplication.shared.delegate!.window
            if theKeyWindow == nil {
                if #available(iOS 13.0, *) {
                    if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                        kwindow = windowScene.windows.first!
                    } else {
                        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                            kwindow = windowScene.windows.first!
                        }
                    }
                } else {
                    kwindow = UIApplication.shared.windows.first!
                }
            }
        }
        
        return kwindow!
    }
    
    
    
    
    
}






