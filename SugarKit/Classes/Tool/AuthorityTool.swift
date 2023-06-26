//
//  AuthorityTool.swift
//  SugarKit
//
//  Created by YouLong on 2023/6/25.
//

import UIKit
import CoreLocation
import AVFoundation
import Photos
import AddressBook
import Contacts
import EventKit


public class AuthorityTool {
    
    /// 位置 权限状态
    public class func locationAuthority() -> String {
        var authority = ""
        if CLLocationManager.locationServicesEnabled() {
            let status = CLLocationManager.authorizationStatus()
            switch status {
            case .notDetermined:
                authority = "NotDetermined"
            case .restricted:
                authority = "Restricted"
                case .denied:
                authority = "Denied"
            case .authorizedAlways:
                authority = "Always"
            case .authorizedWhenInUse:
                authority = "WhenInUse"
            default:
                break
            }
        } else {
            authority = "NoEnabled"
        }
        return authority
    }
    
    /// 推送 权限状态
    public class func pushAuthority() -> String {
        ""
    }
    
    /// video相机 权限状态
    public class func cameraAuthority() -> String {
        var authority = ""
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch status {
        case .notDetermined: //用户还没有选择（第一次）
            authority = "NotDetermined"
        case .restricted: //家长控制
            authority = "Restricted"
        case .denied: //用户拒绝
            authority = "Denied"
        case .authorized: //已授权
            authority = "Authorized"
        default:
            break
        }
        return authority
    }
    
    /// audio录音 权限状态
    public class func audioAuthority() -> String {
        var authority = ""
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.audio)
        switch status {
        case .notDetermined: //用户还没有选择（第一次）
            authority = "NotDetermined"
        case .restricted: //家长控制
            authority = "Restricted"
        case .denied: //用户拒绝
            authority = "Denied"
        case .authorized: //已授权
            authority = "Authorized"
        default:
            break
        }
        return authority
    }
    
    /// 相册 权限状态
    public class func photoAuthority() -> String {
        var authority = ""
        // iOS8.0+
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .notDetermined: //用户还没有选择（第一次）
            authority = "NotDetermined"
        case .restricted: //家长控制
            authority = "Restricted"
        case .denied: //用户拒绝
            authority = "Denied"
        case .authorized: //已授权
            authority = "Authorized"
        default:
            break
        }
        return authority
    }
    
    /// 通讯录 权限状态
    public class func addressAuthority() -> String {
        var authority = ""
        // iOS 9.0 +
        let status = CNContactStore.authorizationStatus(for: CNEntityType.contacts)
        switch status {
        case .notDetermined: //用户还没有选择（第一次）
            authority = "NotDetermined"
        case .restricted: //家长控制
            authority = "Restricted"
        case .denied: //用户拒绝
            authority = "Denied"
        case .authorized: //已授权
            authority = "Authorized"
        default:
            break
        }
        return authority
    }
    
    /// 日历 权限状态
    public class func calendarAuthority() -> String {
        var authority = ""
        let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
        switch status {
        case .notDetermined: //用户还没有选择（第一次）
            authority = "NotDetermined"
        case .restricted: //家长控制
            authority = "Restricted"
        case .denied: //用户拒绝
            authority = "Denied"
        case .authorized: //已授权
            authority = "Authorized"
        default:
            break
        }
        return authority
    }
    
    /// 备忘录 权限状态
    public class func reminderAuthority() -> String {
        var authority = ""
        let status = EKEventStore.authorizationStatus(for: EKEntityType.reminder)
        switch status {
        case .notDetermined: //用户还没有选择（第一次）
            authority = "NotDetermined"
        case .restricted: //家长控制
            authority = "Restricted"
        case .denied: //用户拒绝
            authority = "Denied"
        case .authorized: //已授权
            authority = "Authorized"
        default:
            break
        }
        return authority
    }
    
    /// 蓝牙 权限状态
    public class func bluetoothAuthority() -> String {
        ""
    }
    
//    /// <#name#> 权限状态
//    public class func <#name#>Authority() -> String {
//        var authority = ""
//        let status = <#code...#>
//        switch status {
//        case .notDetermined: //用户还没有选择（第一次）
//            authority = "NotDetermined"
//        case .restricted: //家长控制
//            authority = "Restricted"
//        case .denied: //用户拒绝
//            authority = "Denied"
//        case .authorized: //已授权
//            authority = "Authorized"
//        default:
//            break
//        }
//        return authority
//    }
    


    
}
