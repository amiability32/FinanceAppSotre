//
//  AppListViewModel.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 12..
//  Copyright © 2017년 sally. All rights reserved.
//

import Foundation

class AppListViewModel{
    
    var model: AppListModel
    var delegate: AppListViewModelDelegate?
    private(set) var appList: [AppInfo]
    
    init() {
        self.model = AppListModel()
        self.appList = model.appList
        
        subscribeToNotifications()
        model.load()
    }
    
    deinit {
        unsubscribeFromNotifications()
    }
    
    fileprivate func subscribeToNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(appListDidChangeNotification(_:)),
                                               name: NSNotification.Name(rawValue: Notifications.AppListDidChange),
                                               object: model)
    }
    
    fileprivate func unsubscribeFromNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc fileprivate func appListDidChangeNotification(_ notification: NSNotification){
        self.appList = model.appList
        delegate?.reloadView()
    }
    
}
