//
//  AppListModel.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 11..
//  Copyright © 2017년 sally. All rights reserved.
//

import Alamofire
import SwiftyJSON


enum AppListNotifications {
    static let AppListDidChangeNotification = "AppListDidChangeNotification"
}

class AppListModel {
    
    private final let APP_LIST_URL = "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json"
    public private(set) var appList = [ApplicationVO]()
    
    func load() {
        Alamofire.request(APP_LIST_URL, method: .get, parameters: nil).responseJSON { response in
            guard let responseValue = response.result.value else { return }
            
            let json = JSON(responseValue)
            let feed = json[JsonNames.FEED]
            let entryArray = feed[JsonNames.ENTRY].arrayValue
            
            for entry in entryArray {
                let application = ApplicationVO(entry)
                self.appList.append(application)
            }
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: AppListNotifications.AppListDidChangeNotification), object: self)
        }
    }
}
