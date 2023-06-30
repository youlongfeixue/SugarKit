//
//  AuthorityManager.swift
//  SugarKit
//
//  Created by YouLong on 2023/6/26.
//

import Foundation
import Photos


public class AuthorityManager {
    
    public init() {}
    
    public class func requestPhotoAuthority(_ complition: ((PHAuthorizationStatus)->Void)?) {
        DispatchQueue.global().async {
            PHPhotoLibrary.requestAuthorization { authorizationStatus in
                DispatchQueue.main.async {
                    if complition != nil {
                        complition!(authorizationStatus)
                    }
                }
            }
        }
    }
    
}
