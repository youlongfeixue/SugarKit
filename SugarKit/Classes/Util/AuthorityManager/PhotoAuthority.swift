//
//  PhotoAuthority.swift
//  SugarKit
//
//  Created by YouLong on 2023/6/26.
//

import UIKit
import Photos

public class PhotoAuthority : AuthorityManager {

    public func openAppSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { success in
                if success {
                    // 成功打开设置界面
                } else {
                    // 无法打开设置界面
                }
            })
        }
    }

    public func checkPhotoLibraryPermission() {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            // 已授权，可以访问相册
            break
        case .notDetermined:
            // 未决定，需要请求相册权限
            PHPhotoLibrary.requestAuthorization({ status in
                if status == .authorized {
                    // 用户授权了相册权限
                } else {
                    // 用户拒绝了相册权限
                }
            })
        case .denied, .restricted, .limited:
            // 用户拒绝或受限制，可以提示用户前往设置开启相册权限
            openAppSettings()
        @unknown default:
            break
        }
    }

    
    
}
