//
//  SugarKitExampleTestController.swift
//  SugarKitExample
//
//  Created by Sky on 2020/6/28.
//  Copyright © 2020 Sky. All rights reserved.
//

import UIKit


/*
 SugarKit 测试首页
 */

class SugarKitExampleTestController: SKUIKitHomeTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = [
            ("SKUIKit自定义控件测试", "SKUIKitHomeTableViewController"),
            ("工具类测试", "SKToolsHomeTestController"),
            ("SKExtension测试", "SKExtensionHomeTestController")
        ]
    }

}
