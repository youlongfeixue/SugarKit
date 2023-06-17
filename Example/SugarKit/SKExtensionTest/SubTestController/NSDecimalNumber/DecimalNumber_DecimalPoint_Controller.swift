//
//  DecimalNumber_DecimalPoint_Controller.swift
//  SKSugarSwiftExample
//
//  Created by YouLong on 2021/7/7.
//  Copyright © 2021 Sky. All rights reserved.
//

import UIKit
import SugarKit

class DecimalNumber_DecimalPoint_Controller: BaseViewController {
    
    private lazy var txtNumber = UITextField(sk_text: "128.369", sk_placeholder: "输入原数字", fontSize: 14, color: UIColor.black, keyboardType: .decimalPad)
    private lazy var txtPoint = UITextField(sk_text: "4", sk_placeholder: "转换为几位小数", fontSize: 15, color: UIColor.red, keyboardType: .numberPad)
    private lazy var lblMsg = UILabel(" ")

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setupUI() {
        super.setupUI()
        
        view.addSubview(txtNumber) 
        txtNumber.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(100)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
        }
        
        view.addSubview(txtPoint) 
        txtPoint.snp.makeConstraints { (make) in
            make.top.equalTo(txtNumber.snp.bottom).offset(20)
            make.left.right.equalTo(txtNumber)
        }
        
        let btnConvert = UIButton(sk_title: "转换", backgroundColor: UIColor.lightGray, target: self, action: #selector(onBtnConvertClick))
        view.addSubview(btnConvert) 
        btnConvert.snp.makeConstraints { (make) in
            make.top.equalTo(txtPoint.snp.bottom).offset(20)
            make.left.equalTo(txtPoint)
            make.width.equalTo(50)
        }
        
        view.addSubview(lblMsg) 
        lblMsg.snp.makeConstraints { (make) in
            make.top.equalTo(btnConvert.snp.bottom).offset(20)
            make.left.right.equalTo(txtNumber)
        }
        
    }

    
    
    @objc private func onBtnConvertClick() {
        let number = Double((txtNumber.text ?? "").trim())!
        let pointCount = Int16((txtPoint.text ?? "").trim())!
        
        let str = NSDecimalNumber(value: number).toString(pointCount)
        lblMsg.text = str
    }
}
