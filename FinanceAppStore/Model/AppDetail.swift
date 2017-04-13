//
//  AppDetailVO.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 13..
//  Copyright © 2017년 sally. All rights reserved.
//

import SwiftyJSON

fileprivate struct JsonNames {
    static let ID = "trackId"
    static let NAME = "trackName"
    static let ICON_URL = "artworkUrl60"
    static let SCREENSHOT_URLS = "screenshotUrls"
    static let DESCRIPTION = "description"
    static let RATING = "averageUserRatingForCurrentVersion"
}

class AppDetail {
    let id: Int
    let name: String
    let iconUrl: String
    let screenShotUrl: [String]
    let description: String
    let rating: Float
    
    init(_ json: JSON) {
        id = json[JsonNames.ID].intValue
        name = json[JsonNames.NAME].stringValue
        iconUrl = json[JsonNames.ICON_URL].stringValue
        screenShotUrl = json[JsonNames.SCREENSHOT_URLS].arrayObject as! [String]
        description = json[JsonNames.DESCRIPTION].stringValue
        rating = json[JsonNames.RATING].floatValue
    }
    
}
