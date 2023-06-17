//
//  NSDecimalNumberExtensionController.swift
//  SKSugarSwiftExample
//
//  Created by YouLong on 2021/7/7.
//  Copyright © 2021 Sky. All rights reserved.
//

import UIKit

class NSDecimalNumberExtensionController: BaseViewController {
    private let cellID = "cellID"
    private var ds: [String] = []
    
    private lazy var tv = UITableView(style: .plain, delegate: self, cellReuseIdentifier: cellID, separatorStyle: .singleLine)
    

    override func setupUI() {
        super.setupUI()
        
        tv.frame = view.bounds
        view.addSubviews(tv)
    }
    
    override func initVariables_controller() {
        ds = [
            "测试toString给定小数点位数",
        ]
    }
}



extension NSDecimalNumberExtensionController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = ds[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        switch indexPath.row {
        case 0: //测试小数点位数
            navigationController?.pushViewController(DecimalNumber_DecimalPoint_Controller(), animated: true)
        default: break
    
        }
    }
    
    
}



extension NSDecimalNumberExtensionController {
    
    
    
    
}

