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
    static let ARTIST_NAME = "artistName"
    static let ICON_URL = "artworkUrl100"
    static let SCREENSHOT_URLS = "screenshotUrls"
    static let DESCRIPTION = "description"
    static let RATING = "averageUserRatingForCurrentVersion"
    static let RATING_COUNT = "userRatingCountForCurrentVersion"
}

class AppDetail {
    let id: Int
    let name: String
    let artistName: String
    let iconUrl: String
    let screenShotUrl: [String]
    let description: String
    let rating: Double
    let ratingCount: Int
    
    init(_ json: JSON) {
        id = json[JsonNames.ID].intValue
        name = json[JsonNames.NAME].stringValue
        artistName = json[JsonNames.ARTIST_NAME].stringValue
        iconUrl = json[JsonNames.ICON_URL].stringValue
        screenShotUrl = json[JsonNames.SCREENSHOT_URLS].arrayObject as! [String]
        description = json[JsonNames.DESCRIPTION].stringValue
        rating = json[JsonNames.RATING].doubleValue
        ratingCount = json[JsonNames.RATING_COUNT].intValue
    }
    
}
