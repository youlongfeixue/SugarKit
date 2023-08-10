//
//  DeviceTool.swift
//  SugarKit
//
//  Created by YouLong on 2023/6/21.
//

import Foundation

public class DeviceTool {
    
    /// display name or bundle name
    public class var appName: String {
        var name = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String
        if name?.count == 0 {
            name = Bundle.main.infoDictionary?["CFBundleName"] as? String
        }
        return name!
    }
    
    /// device name
    public class var iphoneName: String {
        UIDevice.current.name
    }
    
    public class var systemVersion: String {
        UIDevice.current.systemVersion
    }
    
    public class var bundleIdentifier: String {
        Bundle.main.bundleIdentifier ?? ""
    }
    
    public class var bundleVersion: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    }
    
    public class var bundleShortVersionString: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    
    
    public class var deviceModel: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        return identifier
    }
    
    public class var deviceType: String {
        let identifier = deviceModel
        
        // iPhone
        if identifier.hasPrefix("iPhone") {
            switch identifier {
            case "iPhone1,1":   return "iPhone 1G"
            case "iPhone1,2":   return "iPhone 3G"
            case "iPhone2,1":   return "iPhone 3GS"
            case "iPhone3,1":   return "iPhone 4"
            case "iPhone3,2":   return "iPhone 4"
            case "iPhone3,3":   return "iPhone 4"
            case "iPhone4,1":   return "iPhone 4S"
            case "iPhone5,1":   return "iPhone 5"
            case "iPhone5,2":   return "iPhone 5"
            case "iPhone5,3":   return "iPhone 5c"
            case "iPhone5,4":   return "iPhone 5c"
            case "iPhone6,1":   return "iPhone 5s"
            case "iPhone6,2":   return "iPhone 5s"
            case "iPhone7,1":   return "iPhone 6 Plus"
            case "iPhone7,2":   return "iPhone 6"
            case "iPhone8,1":   return "iPhone 6s"
            case "iPhone8,2":   return "iPhone 6s Plus"
            case "iPhone8,4":   return "iPhone SE"
            case "iPhone9,1":   return "iPhone 7"
            case "iPhone9,2":   return "iPhone 7 Plus"
            case "iPhone9,3":   return "iPhone 7"
            case "iPhone9,4":   return "iPhone 7 Plus"
            case "iPhone10,1":  return "iPhone 8"
            case "iPhone10,2":  return "iPhone 8 Plus"
            case "iPhone10,3":  return "iPhone X"
            case "iPhone10,4":  return "iPhone 8"
            case "iPhone10,5":  return "iPhone 8 Plus"
            case "iPhone10,6":  return "iPhone X"
            case "iPhone11,2":  return "iPhone XS"
            case "iPhone11,4":  return "iPhone XS Max"
            case "iPhone11,6":  return "iPhone XS Max"
            case "iPhone11,8":  return "iPhone XR"
            case "iPhone12,1":  return "iPhone 11"
            case "iPhone12,3":  return "iPhone 11 Pro"
            case "iPhone12,5":  return "iPhone 11 Pro Max"
            case "iPhone12,8":  return "iPhone SE (2nd generation)"
            case "iPhone13,1":  return "iPhone 12 mini"
            case "iPhone13,2":  return "iPhone 12"
            case "iPhone13,3":  return "iPhone 12 Pro"
            case "iPhone13,4":  return "iPhone 12 Pro Max"
            case "iPhone14,2":  return "iPhone 13 Pro"
            case "iPhone14,3":  return "iPhone 13 Pro Max"
            case "iPhone14,4":  return "iPhone 13 mini"
            case "iPhone14,5":  return "iPhone 13"
            case "iPhone14,6":  return "iPhone 13 Pro Max (2nd generation)"
            case "iPhone14,7":  return "iPhone 13 Pro (2nd generation)"
            case "iPhone14,8":  return "iPhone 13 Pro (2nd generation)"
            case "iPhone14,9":  return "iPhone 13 Pro (2nd generation)"
            case "iPhone15,1":  return "iPhone 14 mini"
            case "iPhone15,2":  return "iPhone 14"
            case "iPhone15,3":  return "iPhone 14 Pro"
            case "iPhone15,4":  return "iPhone 14 Pro Max"
            default:            return "Unknown iPhone"
            }
        }
        
        // iPad
        if identifier.hasPrefix("iPad") {
            switch identifier {
            case "iPad1,1":     return "iPad 1"
            case "iPad2,1":     return "iPad 2"
            case "iPad2,2":     return "iPad 2"
            case "iPad2,3":     return "iPad 2"
            case "iPad2,4":     return "iPad 2"
            case "iPad3,1":     return "iPad (3rd generation)"
            case "iPad3,2":     return "iPad (3rd generation)"
            case "iPad3,3":     return "iPad (3rd generation)"
            case "iPad3,4":     return "iPad (4th generation)"
            case "iPad3,5":     return "iPad (4th generation)"
            case "iPad3,6":     return "iPad (4th generation)"
            case "iPad6,11":    return "iPad (5th generation)"
            case "iPad6,12":    return "iPad (5th generation)"
            case "iPad7,5":     return "iPad (6th generation)"
            case "iPad7,6":     return "iPad (6th generation)"
            case "iPad7,11":    return "iPad (7th generation)"
            case "iPad7,12":    return "iPad (7th generation)"
            case "iPad11,6":    return "iPad (8th generation)"
            case "iPad11,7":    return "iPad (8th generation)"
            case "iPad12,1":    return "iPad (9th generation)"
            case "iPad12,2":    return "iPad (9th generation)"
            case "iPad4,1":     return "iPad Air"
            case "iPad4,2":     return "iPad Air"
            case "iPad4,3":     return "iPad Air"
            case "iPad5,3":     return "iPad Air 2"
            case "iPad5,4":     return "iPad Air 2"
            case "iPad11,3":    return "iPad Air (3rd generation)"
            case "iPad11,4":    return "iPad Air (3rd generation)"
            case "iPad13,1":    return "iPad Air (4th generation)"
            case "iPad13,2":    return "iPad Air (4th generation)"
            case "iPad2,5":     return "iPad mini"
            case "iPad2,6":     return "iPad mini"
            case "iPad2,7":     return "iPad mini"
            case "iPad4,4":     return "iPad mini 2"
            case "iPad4,5":     return "iPad mini 2"
            case "iPad4,6":     return "iPad mini 2"
            case "iPad4,7":     return "iPad mini 3"
            case "iPad4,8":     return "iPad mini 3"
            case "iPad4,9":     return "iPad mini 3"
            case "iPad5,1":     return "iPad mini 4"
            case "iPad5,2":     return "iPad mini 4"
            case "iPad11,1":    return "iPad mini (5th generation)"
            case "iPad11,2":    return "iPad mini (5th generation)"
            case "iPad14,1":    return "iPad mini (6th generation)"
            case "iPad14,2":    return "iPad mini (6th generation)"
            case "iPad6,3":     return "iPad Pro (9.7-inch)"
            case "iPad6,4":     return "iPad Pro (9.7-inch)"
            case "iPad6,7":     return "iPad Pro (12.9-inch)"
            case "iPad6,8":     return "iPad Pro (12.9-inch)"
            case "iPad7,1":     return "iPad Pro (12.9-inch, 2nd generation)"
            case "iPad7,2":     return "iPad Pro (12.9-inch, 2nd generation)"
            case "iPad7,3":     return "iPad Pro (10.5-inch)"
            case "iPad7,4":     return "iPad Pro (10.5-inch)"
            case "iPad8,1":     return "iPad Pro (11-inch)"
            case "iPad8,2":     return "iPad Pro (11-inch)"
            case "iPad8,3":     return "iPad Pro (11-inch)"
            case "iPad8,4":     return "iPad Pro (11-inch)"
            case "iPad8,5":     return "iPad Pro (12.9-inch, 3rd generation)"
            case "iPad8,6":     return "iPad Pro (12.9-inch, 3rd generation)"
            case "iPad8,7":     return "iPad Pro (12.9-inch, 3rd generation)"
            case "iPad8,8":     return "iPad Pro (12.9-inch, 3rd generation)"
            case "iPad8,9":     return "iPad Pro (11-inch, 2nd generation)"
            case "iPad8,10":    return "iPad Pro (11-inch, 2nd generation)"
            case "iPad8,11":    return "iPad Pro (12.9-inch, 4th generation)"
            case "iPad8,12":    return "iPad Pro (12.9-inch, 4th generation)"
            case "iPad13,4":    return "iPad Pro (11-inch, 3rd generation)"
            case "iPad13,5":    return "iPad Pro (11-inch, 3rd generation)"
            case "iPad13,6":    return "iPad Pro (11-inch, 3rd generation)"
            case "iPad13,7":    return "iPad Pro (11-inch, 3rd generation)"
            case "iPad13,8":    return "iPad Pro (12.9-inch, 5th generation)"
            case "iPad13,9":    return "iPad Pro (12.9-inch, 5th generation)"
            case "iPad13,10":   return "iPad Pro (12.9-inch, 5th generation)"
            case "iPad13,11":   return "iPad Pro (12.9-inch, 5th generation)"
            default:            return "Unknown iPad"
            }
        }
        
        // iPod Touch
        if identifier.hasPrefix("iPod") {
            switch identifier {
            case "iPod1,1":     return "iPod touch 1G"
            case "iPod2,1":     return "iPod touch 2G"
            case "iPod3,1":     return "iPod touch 3G"
            case "iPod4,1":     return "iPod touch 4G"
            case "iPod5,1":     return "iPod touch 5G"
            case "iPod7,1":     return "iPod touch 6G"
            case "iPod9,1":     return "iPod touch (7th generation)"
            default:            return "Unknown iPod"
            }
        } 
        
        return "Unknown Device"
    }
    
    
    public class var isIPhone: Bool {
        UIDevice.current.model == "iPhone"
    }
    
    public class var isIPad: Bool {
        UIDevice.current.model == "iPad"
    }
    
    public class var isBangSeries: Bool {
        var isBang = false
        
        if UIDevice.current.userInterfaceIdiom == .phone,
           UIDevice.current.userInterfaceIdiom == .pad 
        {
            if #available(iOS 11.0, *) {
                let mainWindow = AppHelper.getKeyWindow()
                if mainWindow.safeAreaInsets.bottom > 0 {
                    isBang = true
                }
            }
        }
        
        return isBang;
    }
    
    public class var isIPhoneXSeries: Bool {
        isIPhone && isBangSeries
    }
    
    public class var isIPhoneNotBang: Bool {
        isIPhone && !isBangSeries
    }
    
    
    public class var isIPadBangSeries: Bool {
        isIPad && isBangSeries
    }
    
    public class var isIPadNotBang: Bool {
        isIPad && !isBangSeries
    }
    
    public class var isSimulator: Bool {
        false
    }
    
    
    // MARK: - frame
    
    public class var statusBarOffset: CGFloat {
        isBangSeries ? 24 : 0
    }
    
    public class var bottomBarOffset: CGFloat {
        isBangSeries ? 34 : 0
    }
    
    public class var statusBarHeight: CGFloat {
        20.0 + statusBarOffset
    }
    
    /// statusBarHeight + navBar.height
    public class var navigationTopBarHeight: CGFloat {
        44 + statusBarHeight
    }
    
    /// tabBar.height + bottomBarOffset
    public class var bottomBarHeight: CGFloat {
        49 + bottomBarOffset
    }
    
    
    
    
    
    
}












