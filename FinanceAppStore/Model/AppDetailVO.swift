//
//  AppDetailVO.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 13..
//  Copyright © 2017년 sally. All rights reserved.
//

import SwiftyJSON

class AppDetailVO {
    let id: String
    let title: String
    let screenShotUrl: [String]
    
    
    init(_ json: JSON) {
        id = json[JsonNames.ID][JsonNames.ATTRIBUTE][JsonNames.IM_ID].stringValue
        title = json[JsonNames.TITLE][JsonNames.LABEL].stringValue
        screenShotUrl = [String]()
    }
    
}
