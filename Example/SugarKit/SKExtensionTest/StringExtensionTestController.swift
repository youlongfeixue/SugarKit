//
//  StringExtensionTestController.swift
//  SKSugarSwiftExample
//
//  Created by YouLong on 2021/6/16.
//  Copyright © 2021 Sky. All rights reserved.
//

import Foundation
import SnapKit
import SugarKit


class StringExtensionTestController: BaseViewController {
    private lazy var btnSubString = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @objc private func onBtnSubStringClick(_ sender: Any) {
        testSubString()        
    }
    
    
    
    override func setupUI() {
        super.setupUI()
        
        view.addSubview(btnSubString) 
        btnSubString.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(100)
            make.left.equalTo(view).offset(20)
            make.width.equalTo(150)
            make.height.equalTo(44)
        }
        btnSubString.setTitle("btnSubString", for: .normal)
        btnSubString.setTitleColor(UIColor.black, for: .normal)
        btnSubString.backgroundColor = UIColor.orange
        btnSubString.addTarget(self, action: #selector(onBtnSubStringClick(_:)), for: .touchUpInside)
    }
    
    func testSubString() {
        let str = getStr()
        let startKey = "\"parameters\" : {\r\n"
        let endKey = "                            \"cursorScale\""
        var option: SKSubStringContainsOption = .startOnly
//        option = .endOnly
//        option = .both
        option = .neither
        // 截取内容
//        print(str.subString(between: startKey, and: endKey, option: option))
        
        // 删除
        print(str.delete(between: startKey, and: endKey, option: .neither))
    }
    
    
    
    
    
    
    
    
    
    private func getStr() -> String {
        """
        \"video\" : \r\n                        {\r\n                          \"id\" : 4,\r\n                          \"_type\" : \"ScreenVMFile\",\r\n                          \"src\" : 1,\r\n                          \"trackNumber\" : 0,\r\n                          \"attributes\" : {\r\n                            \"ident\" : \"Rec 6-7-2021\"\r\n                          },\r\n                          \"parameters\" : {\r\n                            \"sourceCrop0\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 0.0,\r\n                              \"interp\" : \"eioe\"\r\n                            },\r\n                            \"sourceCrop1\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 0.0,\r\n                              \"interp\" : \"eioe\"\r\n                            },\r\n                            \"sourceCrop2\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 0.0,\r\n                              \"interp\" : \"eioe\"\r\n                            },\r\n                            \"sourceCrop3\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 0.0,\r\n                              \"interp\" : \"eioe\"\r\n                            },\r\n                            \"geometryCrop0\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 0.0,\r\n                              \"interp\" : \"eioe\"\r\n                            },\r\n                            \"geometryCrop1\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 0.0,\r\n                              \"interp\" : \"eioe\"\r\n                            },\r\n                            \"geometryCrop2\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 0.0,\r\n                              \"interp\" : \"eioe\"\r\n                            },\r\n                            \"geometryCrop3\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 0.0,\r\n                              \"interp\" : \"eioe\"\r\n                            },\r\n                            \"cursorScale\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 1.0,\r\n                              \"interp\" : \"linr\"\r\n                            },\r\n                            \"cursorOpacity\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 1.0,\r\n                              \"interp\" : \"linr\"\r\n                            }\r\n                          },\r\n                          \"effects\" : [\r\n\r\n                          ],\r\n                          \"start\" : 0,\r\n                          \"duration\" : 34,\r\n                          \"mediaStart\" : 0,\r\n                          \"mediaDuration\" : 34,\r\n                          \"scalar\" : 1,\r\n                          \"animationTracks\" : {\r\n\r\n                          }\r\n                        },\r\n                    \"audio\" : \r\n                        {\r\n                          \"id\" : 5,\r\n                          \"_type\" : \"AMFile\",\r\n                          \"src\" : 1,\r\n                          \"trackNumber\" : 1,\r\n                          \"attributes\" : {\r\n                            \"ident\" : \"\",\r\n                            \"gain\" : 1.0,\r\n                            \"mixToMono\" : false\r\n                          },\r\n                            \"channelNumber\" : \"0,1\",\r\n                          \"effects\" : [\r\n\r\n                          ],\r\n                          \"start\" : 0,\r\n                          \"duration\" : 34,\r\n                          \"mediaStart\" : 0,\r\n                          \"mediaDuration\" : 34,\r\n                          \"scalar\" : 1,\r\n                          \"animationTracks\" : {\r\n\r\n                          }\r\n                        }\r\n,\r\n                    \"start\" : 0,\r\n                    \"duration\" : 34,\r\n                    \"mediaStart\" : 0,\r\n                    \"mediaDuration\" : 373,\r\n                    \"scalar\" : 1,\r\n                    \"metadata\" : {\r\n                      \"AutoAppliedSmartFocus\" : \"False\",\r\n                      \"clipSpeedAttribute\" : false,\r\n                      \"default-scale\" : \"1\",\r\n                      \"effectApplied\" : \"none\"\r\n                    }\r\n                  }\r\n                ]\r\n              },\r\n              {\r\n                \"trackIndex\" : 1,\r\n                \"medias\" : [\r\n                  {\r\n                    \"id\" : 6,\r\n                    \"_type\" : \"UnifiedMedia\",\r\n                    \"video\" : \r\n                        {\r\n                          \"id\" : 7,\r\n                          \"_type\" : \"ScreenVMFile\",\r\n                          \"src\" : 1,\r\n                          \"trackNumber\" : 0,\r\n                          \"attributes\" : {\r\n                            \"ident\" : \"Rec 6-7-2021\"\r\n                          },\r\n                          \"parameters\" : {\r\n                            \"sourceCrop0\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 0.0,\r\n                              \"interp\" : \"eioe\"\r\n                            },\r\n                            \"sourceCrop1\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 0.0,\r\n                              \"interp\" : \"eioe\"\r\n                            },\r\n                            \"sourceCrop2\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 0.0,\r\n                              \"interp\" : \"eioe\"\r\n                            },\r\n                            \"sourceCrop3\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 0.0,\r\n                              \"interp\" : \"eioe\"\r\n                            },\r\n                            \"geometryCrop0\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 0.0,\r\n                              \"interp\" : \"eioe\"\r\n                            },\r\n                            \"geometryCrop1\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 0.0,\r\n                              \"interp\" : \"eioe\"\r\n                            },\r\n                            \"geometryCrop2\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 0.0,\r\n                              \"interp\" : \"eioe\"\r\n                            },\r\n                            \"geometryCrop3\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 0.0,\r\n                              \"interp\" : \"eioe\"\r\n                            },\r\n                            \"cursorScale\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 1.0,\r\n                              \"interp\" : \"linr\"\r\n                            },\r\n                            \"cursorOpacity\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 1.0,\r\n                              \"interp\" : \"linr\"\r\n                            }\r\n                          },\r\n                          \"effects\" : [\r\n\r\n                          ],\r\n                          \"start\" : 0,\r\n                          \"duration\" : 39,\r\n                          \"mediaStart\" : 34,\r\n                          \"mediaDuration\" : 39,\r\n                          \"scalar\" : 1,\r\n                          \"animationTracks\" : {\r\n\r\n                          }\r\n                        },\r\n                    \"audio\" : \r\n                        {\r\n                          \"id\" : 8,\r\n                          \"_type\" : \"AMFile\",\r\n                          \"src\" : 1,\r\n                          \"trackNumber\" : 1,\r\n                          \"attributes\" : {\r\n                            \"ident\" : \"\",\r\n                            \"gain\" : 1.0,\r\n                            \"mixToMono\" : false\r\n                          },\r\n                            \"channelNumber\" : \"0,1\",\r\n                          \"effects\" : [\r\n\r\n                          ],\r\n                          \"start\" : 0,\r\n                          \"duration\" : 39,\r\n                          \"mediaStart\" : 34,\r\n                          \"mediaDuration\" : 39,\r\n                          \"scalar\" : 1,\r\n                          \"animationTracks\" : {\r\n\r\n                          }\r\n                        }\r\n,\r\n                    \"start\" : 0,\r\n                    \"duration\" : 39,\r\n                    \"mediaStart\" : 0,\r\n                    \"mediaDuration\" : 373,\r\n                    \"scalar\" : 1,\r\n                    \"metadata\" : {\r\n                      \"AutoAppliedSmartFocus\" : \"False\",\r\n                      \"clipSpeedAttribute\" : false,\r\n                      \"default-scale\" : \"1\",\r\n                      \"effectApplied\" : \"none\"\r\n                    }\r\n                  },\r\n                  {\r\n                    \"id\" : 9,\r\n                    \"_type\" : \"UnifiedMedia\",\r\n                    \"video\" : \r\n                        {\r\n                          \"id\" : 10,\r\n                          \"_type\" : \"ScreenVMFile\",\r\n                          \"src\" : 1,\r\n                          \"trackNumber\" : 0,\r\n                          \"attributes\" : {\r\n                            \"ident\" : \"Rec 6-7-2021\"\r\n                          },\r\n                          \"parameters\" : {\r\n                            \"sourceCrop0\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" : 0.0,\r\n                              \"interp\" : \"eioe\"\r\n                            },\r\n                            \"sourceCrop1\" : {\r\n                              \"type\" : \"double\",\r\n                              \"defaultValue\" 
        """
    }
}
