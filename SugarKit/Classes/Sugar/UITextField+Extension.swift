//
//  UITextField+Extension.swift
//  SKSugarSwiftExample
//
//  Created by YouLong on 2021/7/7.
//  Copyright © 2021 Sky. All rights reserved.
//

import UIKit

/// 数字标点符号集
public let punctuationSet: Set = Set(arrayLiteral: "%", "-", "+", "x", "×", "/", ",", "#", "?", ":", "_", "*")

// MARK: - init
public extension UITextField {
    
    convenience init(sk_text: String = "", sk_placeholder: String, fontSize: CGFloat = 14, isBold: Bool = false, color: UIColor = UIColor.black, alignment: NSTextAlignment = .left, keyboardType kbType: UIKeyboardType = .default/*, showAccessoryView: Bool = false*/) 
    {
        self.init()
        text = sk_text
        placeholder = sk_placeholder
        font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        textColor = color
        textAlignment = alignment
        keyboardType = kbType
        /*if showAccessoryView { inputAccessoryView = GXInputAccessoryView(title: "完成") }*/
    }
    
    
    
    
    
    
    
}



// MARK: - attributes
public extension UITextField {
    
    func setAttr(inputView inpView: UIView, accessoryView: UIView, keyboardType kbType: UIKeyboardType = .default) {
        inputView = inpView
        inputAccessoryView = accessoryView
        keyboardType = kbType
    }
    
    
    /// 根据 textF 的 keyboardType 检查输入的字符串（如果是 numberPad 或 decimalPad 要过滤掉 搜狗输入法 等键盘上的 ’其它符号‘ - punctuation）
    /// -此方法用在 “文字改变” 事件中
    func checkText() -> String {
        let str = text!.trimmingCharacters(in: CharacterSet.whitespaces)
        var temp = str
        
        if keyboardType == .decimalPad || keyboardType == .numberPad {
            if keyboardType == .numberPad {
                temp = str.replacingOccurrences(of: ".", with: "")
            }
            let lastCh = String(str.suffix(1))
            if punctuationSet.contains(lastCh) {
                temp = str.replace(of: lastCh, with: "")
            }
            text = temp
        }
        return temp
    }
    
    
}




