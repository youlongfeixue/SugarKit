//
//  String+Extension.swift
//  SKSugarSwiftExample
//
//  Created by Sky on 2021/4/7.
//  Copyright © 2021 Sky. All rights reserved.
//

import Foundation

/// 截取字符串key的包含情况
public enum SKSubStringContainsOption {
    /// 只包含 startKey
    case startOnly
    /// 只包含 endKey
    case endOnly
    /// startKey 和 endKey 都包含
    case both
    /// startKey 和 endKey 都不包含
    case neither
}



// MARK: - check
public extension String {
    
    static func isNullOrEmpty(_ str: String?) -> Bool {
        return str == nil || str! == "" || str!.count == 0
    }
    
    /// return count == 0
    func isEmpty() -> Bool {
        count == 0
    }
    
    func getNonNullString() -> String {
        if count == 0 { return "" }
        
        let temp = lowercased()
        if temp == "" || temp == "null" || temp == "nil" || temp == "nan"
            || temp == "<nil>" || temp == "<null>" || temp == "<nan>" 
            || temp == "(nil)" || temp == "(null)" || temp == "(nan)" 
            || temp == "false" || temp == "no" || temp == "0"
        {
            return ""
        }
        
        return self
    }
    
    /// trim 去掉前后的所有空格
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
}


// MARK: -  convert number to format string.
public extension String {
    
    /// 转为给定有效位数小数的字符串 - 默认为2为小数
    static func convert(number: Float, dotCount: Int8 = 2) -> String {
        String(format: "%.0\(dotCount)f", number)
    }
    
    /// 转为给定有效位数小数的字符串- 默认为2为小数
    static func convert(number: Double, dotCount: Int8 = 2) -> String {
        String(format: "%.0\(dotCount)f", number)
    }
    
    /// 转为给定有效位数小数的字符串- 默认为2为小数
    static func convert(number: Int, dotCount: Int8 = 2) -> String {
        String(format: "%.0\(dotCount)f", number)
    }
    
    
    
    
    
    
}


// MARK: -  Range
public extension String {
    
    /// sk - 字符串从头到尾的 nsRange 范围
    func sk_allRange() -> NSRange {
        return NSRange(location: 0, length: count)
    }
    
    /// sk - nsRange 转换为 Range<String.Index>
    ///
    ///  Range<String.Index> 是一个半开放的区间，前闭后开区间，不包含最大值
    func sk_range(by nsRange: NSRange) -> Range<String.Index>? {
        let utf16Str = utf8
        guard let start = utf16Str.index(utf16Str.startIndex, offsetBy: nsRange.lowerBound, limitedBy: utf16Str.endIndex),
              let end = utf16Str.index(utf16Str.startIndex, offsetBy: nsRange.upperBound, limitedBy: utf16Str.endIndex)
        else { return nil }
        
        return start..<end
    }
    
    /// sk - Range<String.Index> 转换为 nsRange
    func sk_nsRange(by range: Range<String.Index>) -> NSRange? {
//        let utf16Str = utf8
//        guard let start = range.lowerBound.samePosition(in: utf16Str),
//              let end = range.upperBound.samePosition(in: utf16Str)
//        else { return nil }
//        
//        let location = utf16Str.distance(from: utf16Str.startIndex, to: start)
//        let length = utf16Str.distance(from: start, to: end)
//        
//        return NSRange(location: location, length: length)
        

        let start = range.lowerBound.utf16Offset(in: self)
        let end = range.upperBound.utf16Offset(in: self)
        return NSRange(location: start, length: end - start)
    }
    
    
    
    
}


// MARK: -  indexOf && search 字符串查找
public extension String {
    
    func index(of key: String) -> Int {
        guard let ran = range(of: key) else { return -1 }
        _ = ran.upperBound.utf16Offset(in: self)
        return sk_nsRange(by: ran)!.location
    }
    
    func index(of key: String) -> NSRange? {
        guard let ran = range(of: key) else { return nil }
        return sk_nsRange(by: ran)
    }
    
    /// 从前往后对给定的 startKey 到 endKey 之间的内容进行查找，返回 [Range<String.Index>] 数组 (前闭后开区间)
    func sk_range(between startKey: String, and endKey: String, option: SKSubStringContainsOption) -> [Range<String.Index>] {
        // Range<String.Index> 是一个半开放的区间，前闭后开区间，不包含最大值
        
        var arr: [Range<String.Index>] = [] //[Range<String.Index>]()
        var lower = startIndex
        
        while true {
            if let start = range(of: startKey, options: CompareOptions.caseInsensitive, range: lower..<endIndex, locale: nil),
               let end = range(of: endKey, options: CompareOptions.caseInsensitive, range: lower..<endIndex, locale: nil)
            {            
                var start_index = startIndex
                var end_index = endIndex
                
                switch option {
                case .startOnly:
                    start_index = start.lowerBound
                    end_index = end.lowerBound
                case .endOnly:
                    start_index = start.upperBound
                    end_index = end.upperBound
                case .both:
                    start_index = start.lowerBound
                    end_index = end.upperBound
                default: //.neither
                    start_index = start.upperBound
                    end_index = end.lowerBound
                }
                lower = end.upperBound
                
                arr.append(start_index..<end_index)
            }
            else { break }
        }
        print(arr)
        
        // Range<String.Index> 是一个半开放的区间，前闭后开区间，不包含最大值
        return arr // start_index..<end_index
    }
    
    
    
     
}


// MARK: -  字符串截取 subString
public extension String {
    
    /// 截取 startKey 到 endKey 之间的字符串 (可能有多个内容，全部截取)，返回截取的字符串内容数组
    func subString(between startKey: String, and endKey: String, option: SKSubStringContainsOption) -> [String] {
        let rangeArr = sk_range(between: startKey, and: endKey, option: option)
        
        var arr: [String] = []
        for range in rangeArr {
            arr.append(String(self[range]))
        }
        
        return arr
    }
    
    /// 截取 startKey 到 endKey 之间的字符串，返回按顺序第一次截取到的内容
    func subString(firstOfBetween startKey: String, and endKey: String, option: SKSubStringContainsOption) -> String {
        let arr = subString(between: startKey, and: endKey, option: option)
        return arr.isEmpty ? "" : arr.first!
    }
    
}


// MARK: -  字符串拼接
public extension String {
    
    /// 拼接字符串，并在末尾添加一个反斜杠"xxxxxx/"
    /// -（如果末尾本来已经有一个反斜杠，则不再添加。）
    @discardableResult mutating func append(skComponent otherString: String) -> String {
        append(otherString)
        if last! != "/" { append("/") }
        return self
    }
    
    /// 拼接字符串，并在末尾添加一个反斜杠"xxxxxx/"
    /// -（如果末尾本来已经有一个反斜杠，则不再添加。）
    @discardableResult func appending(skComponent otherString: String) -> String {
        var tmp = appending(otherString)
        if tmp.last! != "/" { tmp.append("/") }
        return tmp
    }
    
}



// MARK: -  字符串删除
public extension String {
    
    /// 删除 startKey 到 endKey 之间的内容 (可能有多个内容，全部删除)
    func delete(between startKey: String, and endKey: String, option: SKSubStringContainsOption) -> String {
        replace(between: startKey, and: endKey, with: "", option: option)
    }
    
}


// MARK: -  字符串替换
public extension String {
    
    func replace<SKString>(of key: SKString, with other: SKString) -> String where SKString : StringProtocol {
        replacingOccurrences(of: key, with: other)
    }

    /// 替换 startKey 到 endKey 之间的内容 (可能有多个内容，全部替换)
    func replace(between startKey: String, and endKey: String, with replacement: String, option: SKSubStringContainsOption) -> String {
        
        let arr = subString(between: startKey, and: endKey, option: option)
        var newStr = self
        for key in arr {
            newStr = newStr.replacingOccurrences(of: key, with: replacement)
        }        
        
        return newStr
    }
    
}
    
    
    
