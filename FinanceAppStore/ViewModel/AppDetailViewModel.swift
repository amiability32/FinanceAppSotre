//
//  AppDetailViewModel.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 13..
//  Copyright © 2017년 sally. All rights reserved.
//

import Foundation

class AppDetailViewModel {
    
    var model: AppDetailModel
    var delegate: AppDetailViewModelDelegate?
    var appId: String?
    private(set) var appDetail: AppDetailVO?
    
    init(appId: String) {
        self.appId = appId
        self.model = AppDetailModel(appId: appId)
        self.appDetail = model.appDetail
        
        subscribeToNotifications()
        model.load()
    }
    
    deinit {
        unsubscribeFromNotifications()
    }
    
    fileprivate func subscribeToNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(appListDidChangeNotification(_:)),
                                               name: NSNotification.Name(rawValue: Notifications.AppDetailDidChange),
                                               object: model)
    }
    
    fileprivate func unsubscribeFromNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc fileprivate func appListDidChangeNotification(_ notification: NSNotification){
        self.appDetail = model.appDetail
        delegate?.reloadView()
    }
    
}
