//
//  NSDecimalNumber+Extension.swift
//  SKSugarSwiftExample
//
//  Created by YouLong on 2021/7/7.
//  Copyright © 2021 Sky. All rights reserved.
//

import Foundation


/*
typedef NS_ENUM(NSUInteger, NSRoundingMode) {
    NSRoundPlain,   // 四舍五入
    NSRoundDown,    // 只舍不入
    NSRoundUp,      // 只入不舍
    NSRoundBankers  // 这个是特殊的四舍五入。保留位数的后一位为5时，根据保留位数的奇偶性来确定舍入规则。例如：0.235保留两位小数，5前面为3，奇数要进1，结果为0.24。如果是0.245，5前面为4，偶数要舍，结果为0.24。
};
 
// scale 保留几位小数
 Exactness：进度异常、
 Overflow:向上溢出、
 Underflow：向下溢出、
 DivideByZero：除数为0。
 当参数为YES出错会抛出异常，为NO时忽略异常。返回nil.
 let handler = NSDecimalNumberHandler(roundingMode: mode, scale: scale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
*/


// MARK: - check
public extension NSDecimalNumber {
    
    static func isNullOrEmpty(_ aNumber: NSDecimalNumber?) -> Bool {
        guard let value = aNumber else { return false }
        return value == NSDecimalNumber.notANumber
        || value.isKind(of: NSNull.self)
        || value.self == NSNull()
        || value.description.lowercased() == "NaN".lowercased()
    }
    
    static func getNonnullNumber(_ aNumber: NSDecimalNumber?) -> NSDecimalNumber {
        isNullOrEmpty(aNumber) ? NSDecimalNumber.zero : aNumber!
    }
}


// MARK: -  to string
public extension NSDecimalNumber {
    
    func toString(_ scale: Int16 = 2) -> String {
        if NSDecimalNumber.isNullOrEmpty(self) { return "0" }
        
        let str = String(format: "%@", self)
        if str.isEmpty() || str.lowercased() == "NaN".lowercased() { return "0" }
        
        var integerStr = str
        var rightF = 0.0
        if str.contains(".") {
            let arr = str.components(separatedBy: ".")
            integerStr = arr.first!
            rightF = Double(String(format: "0.%@", arr[1]))!
        }
        let pointTra = String(format: "%.\(scale)f", rightF)
        return integerStr + "." + pointTra.components(separatedBy: ".").last!
    }
}




// MARK: -  bigDecimal
public extension NSDecimalNumber {
    
    func add(_ aNumber: NSDecimalNumber) -> NSDecimalNumber {
        adding(aNumber)
    }
    
    func subtract(_ aNumber: NSDecimalNumber) -> NSDecimalNumber {
        subtracting(aNumber)
    }
    
    func multiply(_ aNumber: NSDecimalNumber) -> NSDecimalNumber {
        multiplying(by: aNumber)
    }
    
    func divide(_ aNumber: NSDecimalNumber) -> NSDecimalNumber {
        dividing(by: aNumber)
    }
    
    
    func divide(_ aNumber: NSDecimalNumber, scale: Int16 = 2, roundingMode mode: RoundingMode) -> NSDecimalNumber {
        dividing(by: aNumber, withBehavior: NSDecimalNumberHandler(roundingMode: mode, scale: scale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false))
    }
    
    func sk_setScale(_ scale: Int16, roundingMode mode: RoundingMode = .plain) -> NSDecimalNumber {
        rounding(accordingToBehavior: NSDecimalNumberHandler(roundingMode: mode, scale: scale, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false))
    }
    
    /// 取绝对值
    func abs() -> NSDecimalNumber {
        (compare(NSDecimalNumber.zero) == .orderedAscending) ? multiplying(by: NSDecimalNumber(value: -1)) : self
    }
    
    /// 取相反数
    func negate() -> NSDecimalNumber {
        multiplying(by: NSDecimalNumber(value: -1))
    }
}






