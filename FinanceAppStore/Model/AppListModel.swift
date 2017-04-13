//
//  AppListModel.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 11..
//  Copyright © 2017년 sally. All rights reserved.
//

import Alamofire
import SwiftyJSON

class AppListModel {
    
    public private(set) var appList = [AppVO]()
    
    func load() {
        Alamofire.request(Urls.APP_LIST, method: .get, parameters: nil).responseJSON { response in
            guard let responseValue = response.result.value else { return }
            
            let json = JSON(responseValue)
            let feed = json[JsonNames.FEED]
            let entryArray = feed[JsonNames.ENTRY].arrayValue
            
            for entry in entryArray {
                let application = AppVO(entry)
                self.appList.append(application)
            }
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: Notifications.AppListDidChangeNotification), object: self)
        }
    }
}
