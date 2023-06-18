//
//  Times.swift
//  SugarKitExample
//
//  Created by Sky on 2020/7/2.
//  Copyright © 2020 Sky. All rights reserved.
//

import Foundation


/// 耗时测试工具类
@objcMembers public class Times {
    
    /// 用于 after_successive 方法，记录上一次点击时间
    private static var lastTime: TimeInterval = 0
    
    public class func times(_ function: ()->(), _ isConvertTime: Bool = false) {
        let begin = CFAbsoluteTimeGetCurrent()
        function()
        let end = CFAbsoluteTimeGetCurrent()
        
        let diff = end - begin
        
        isConvertTime
        ? print("\n代码耗时 times = \(diff) s(秒)； 合时间为：【\(convertToTime(interval: diff))】")
        : print("\n代码耗时 times = \(diff) s(秒)")
    }
    
    
    public class func convertToTime(interval: TimeInterval) -> String {
        // 3662.89567
        
        let decimal_part: Double = interval - ceil(interval) //小数部分
        // 0.89567
        
        let mm_int: Int = Int(interval) % 3600
        // 62
        
        let ss_int: Int = mm_int % 60
        // 2
        
        let sss_interval = decimal_part * 100.0
        // 895.67
        
        return "\(Int(interval / 3600.0)):\(Int(mm_int / 60)):\(ss_int) \(sss_interval)"
    }
    
}




// MARK: -  连续输入时延迟触发

public enum QueueType: Int {
    case currentQueue = 0
    case mainQueue = 1
    case globalQueue = 2
}

public extension Times {
    
    /// 延迟触发，时间单位为秒s
    /// - Parameters:
    ///   - time: 延迟时间，单位为秒s
    ///   - inQueue: 延迟后执行任务所在的线程：当前队列currentQueue、mainQueue、globalQueue
    ///   - handle: 延迟后任务回调
    static func after(delay time: TimeInterval, inQueue: QueueType = .currentQueue, handle: @escaping ()->Void) {
        switch inQueue {
        case .currentQueue:
            if Thread.isMainThread {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) { handle() }
            } else {
                DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + time) { handle() }
            }
        case .mainQueue:
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) { handle() }
        case .globalQueue:
            DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + time) { handle() }
        }
    }
    
    /// 连续操作延时触发，时间单位为秒s
    /// - 比如实时搜索时，需要在结束输入一段时间后才去执行搜索
    /// - Parameters:
    ///   - time: 延迟时间，单位为秒s
    ///   - inQueue: 延迟后执行任务所在的队列：当前队列currentQueue、mainQueue、globalQueue
    ///   - handle: 延迟后任务回调
    static func after(successive time: TimeInterval, inQueue: QueueType = .currentQueue, handle: @escaping ()->Void) {
        func exec() {
            if Date().timeIntervalSince1970 - NSTimeIntervalSince1970 - lastTime >= time { handle() } 
        }
        
        switch inQueue {
        case .currentQueue:
            if Thread.isMainThread {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) { exec() }
            } else {
                DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + time) { exec() }
            }
        case .mainQueue:
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) { exec() }
        case .globalQueue:
            DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + time) { exec() }
        }
        
        lastTime = Date().timeIntervalSince1970 - NSTimeIntervalSince1970
    }
    
}
























