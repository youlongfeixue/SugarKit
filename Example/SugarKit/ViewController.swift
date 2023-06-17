//
//  ViewController.swift
//  SugarKit
//
//  Created by youlongfeixue on 06/17/2023.
//  Copyright (c) 2023 youlongfeixue. All rights reserved.
//

import UIKit
import SugarKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController viewDidLoad")
        
        //        print(DispatchTime.now())
        //        print(Date().timeIntervalSince1970 - NSTimeIntervalSince1970)
        
        print("Test delay: begin")
        //        Times.after(delay: 3) { 
        //            print("in 3 s...")
        //        }
        
        for _ in 0..<5 {
            DispatchQueue.global().async {
                Times.after(successive: 3) { 
                    print("after 3 s...")
                }
            }
            
            Thread.sleep(forTimeInterval: 1)
        }
        print("delay end")
        
        setupUI()
    }
    
    
    
    
    
    private func setupUI() {
        view.backgroundColor = UIColor.white
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "测试首页", style: .plain, target: self, action: #selector(testHomeAction))
    }
    
}



extension ViewController {
    
    @objc private func testHomeAction() {
        navigationController?.pushViewController(SugarKitExampleTestController(), animated: true)
    }
    
    
}


