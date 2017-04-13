//
//  AppDetailViewController.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 13..
//  Copyright © 2017년 sally. All rights reserved.
//

import UIKit

class AppDetailViewController: UIViewController {

    var appId: String?
    var viewModel: AppDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let appId = appId {
            viewModel = AppDetailViewModel(appId: appId)
        }
    }
}
