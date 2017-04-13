//
//  ApplicationVO.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 11..
//  Copyright © 2017년 sally. All rights reserved.
//

import SwiftyJSON

fileprivate struct JsonNames {
    static let LABEL = "label"
    static let ATTRIBUTE = "attributes"
    
    static let ID = "id"
    static let IM_ID = "im:id"
    static let TITLE = "title"
    static let IM_IMAGE = "im:image"
}

class AppInfo {
    let id: String
    let title: String
    let iconUrl: String
    
    init(_ json: JSON) {
        id = json[JsonNames.ID][JsonNames.ATTRIBUTE][JsonNames.IM_ID].stringValue
        title = json[JsonNames.TITLE][JsonNames.LABEL].stringValue
        iconUrl = json[JsonNames.IM_IMAGE].arrayValue[0][JsonNames.LABEL].stringValue
    }
    
}
