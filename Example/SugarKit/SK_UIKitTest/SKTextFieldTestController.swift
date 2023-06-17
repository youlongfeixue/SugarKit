//
//  SKTextFieldTestController.swift
//  SugarKitExample
//
//  Created by Sky on 2020/6/28.
//  Copyright © 2020 Sky. All rights reserved.
//

import UIKit
import SugarKit

class SKTextFieldTestController: BaseViewController {
    
    
    private lazy var txt: SKTextField = SKTextField(sk_text: "", fontSize: 17, textColor: UIColor.purple, placeholder: "我们都有一个家，名字叫中国。兄弟姐妹都很多，景色也不错！", textAlignment: .left)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @objc private func ocTest() {
//        navigationController?.pushViewController(SKTextFieldTestOCController(), animated: true)
    }

    override func setupUI() {
        super.setupUI()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "oc版", style: .plain, target: self, action: #selector(ocTest))
        
        view.addSubview(txt)
        txt.delegate = self
        txt.isAutoHeight = false
        
        txt.textColor = UIColor.red
        txt.layer.borderColor = UIColor.gray.cgColor
        txt.layer.borderWidth = 1.0
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        txt.frame = CGRect(x: 20, y: 100, width: 100, height: 85)
    }

}



// MARK: -  SKTextFieldDelegate

extension SKTextFieldTestController : UITextViewDelegate {
    
//    func textViewDidChange(_ textView: UITextView) {
//        (textView as! SKTextField).checkText { (str) in
//            print("checked str =", str)
//            
//            
//        }
//    }
    
    
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        
//        (textView as! SKTextField).checkText { (str) in
//            print("checked str =", str)
//            
//            
//        }
//        
//        return true
//    }
}
