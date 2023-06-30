//
//  PhotoManager.swift
//  SugarKit
//
//  Created by YouLong on 2023/6/27.
//

import Foundation
import Photos

public typealias PhotoResultCountCompletion = ((_ count: Int, _ size: Double) -> Void)
public enum PhotoType : Int {
    case image = 0
    case video = 1
    case all = 2
} 

public class PhotoManager {
    
    private class func SafeMainThread(_ handler: @escaping ()->Void) {
        if Thread.isMainThread {
            handler()
        } else {
            DispatchQueue.main.async {
                handler()
            }
        }
    }
    
    /// 相册个数
    public class func albumCount(_ completion: @escaping PhotoResultCountCompletion) { 
        
    }
    
    /// 图片个数
    public class func imagesInfo(_ completion: @escaping PhotoResultCountCompletion) { 
        allResultInfo(.image, completion)
    }
    
    /// 视频个数
    public class func videosInfo(_ completion: @escaping PhotoResultCountCompletion) { 
        allResultInfo(.video, completion)
    }
    
    /// 相册内资源item的个数（ 图片/ 视频/ (图片+视频)总数 ）
    public class func allResultInfo(_ photoType: PhotoType, _ completion: @escaping PhotoResultCountCompletion) {
        DispatchQueue.global().async {
            let option = PHFetchOptions()
            switch photoType {
            case .image:
                option.predicate = NSPredicate(format: "mediaType == %ld", PHAssetMediaType.image.rawValue)
            case .video:
                option.predicate = NSPredicate(format: "mediaType == %ld", PHAssetMediaType.video.rawValue)
            case .all:
                break
            }
            
            let allAssets = PHAsset.fetchAssets(with: option)
            var totalSize: Double = 0
            
            // 遍历每个元素
            allAssets.enumerateObjects { (asset, _, _) in
                let assetSize = calculateAssetSize(asset: asset)
                totalSize += assetSize
            }
            
            SafeMainThread {
                completion(allAssets.count, totalSize)
            }
        }// global end
    }
    
    /// 计算单个资源的大小
    public class func calculateAssetSize(asset: PHAsset) -> Double {
        var assetSize: Double = 0
        
        let resources = PHAssetResource.assetResources(for: asset)
        
        // 获取资源的文件大小
        if let resource = resources.first {
            let imageSize = Double(resource.value(forKey: "fileSize") as? Int ?? 0)
            assetSize = imageSize
        }
        
        return assetSize
    }
    
    
}

