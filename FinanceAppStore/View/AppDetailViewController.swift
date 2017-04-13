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
    fileprivate var appDetail: AppDetailVO?
    var viewModel: AppDetailViewModel?
    
    @IBOutlet var titleView: UIView!
    @IBOutlet var screenShotView: UIView!
    @IBOutlet var descriptionView: UIView!
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let appId = appId {
            viewModel = AppDetailViewModel(appId: appId)
            viewModel?.delegate = self
        }
        
    }
}

extension AppDetailViewController: AppDetailViewModelDelegate {
    
    func reloadView() {
        appDetail = viewModel?.appDetail
        
        setTitleView()
        setScreenShotView()
        setDescriptionView()
    }
    
    private func setTitleView() {
        guard let appDetail = appDetail else { return }
        
        iconImageView.af_setImage(withURL: URL(string: appDetail.iconUrl)!)
        nameLabel.text = appDetail.name
    }
    
    private func setScreenShotView() {
        guard let appDetail = appDetail else { return }
    }
    
    private func setDescriptionView() {
        guard let appDetail = appDetail else { return }
    }
}
