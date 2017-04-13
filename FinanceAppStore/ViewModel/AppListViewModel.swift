//
//  AppListViewModel.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 12..
//  Copyright © 2017년 sally. All rights reserved.
//

import Foundation

class AppListViewModel: NSObject{
    
    var model: AppListModel
    var delegate: AppListViewModelDelegate?
    private(set) var appList: [ApplicationVO]
    
    override init() {
        self.model = AppListModel()
        self.appList = model.appList
        
        super.init()
        subscribeToNotifications()
        model.load()
    }
    
    deinit {
        unsubscribeFromNotifications()
    }
    
    fileprivate func subscribeToNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(appListDidChangeNotification(_:)),
                                               name: NSNotification.Name(rawValue: AppListNotifications.AppListDidChangeNotification),
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
