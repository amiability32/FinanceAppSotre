//
//  ApplicationVO.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 11..
//  Copyright © 2017년 sally. All rights reserved.
//

import SwiftyJSON

class ApplicationVO {
    let id: String
    let title: String
    let iconUrl: String
    let summary: String
    
    init(_ json: JSON) {
        id = json[JsonNames.ID][JsonNames.ATTRIBUTE][JsonNames.IM_ID].stringValue
        title = json[JsonNames.TITLE][JsonNames.LABEL].stringValue
        iconUrl = json[JsonNames.IM_IMAGE].arrayValue[0][JsonNames.LABEL].stringValue
        summary = json[JsonNames.SUMMARY][JsonNames.LABEL].stringValue
    }
    
}
