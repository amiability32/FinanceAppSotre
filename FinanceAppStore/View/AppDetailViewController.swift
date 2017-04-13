//
//  AppDetailViewController.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 13..
//  Copyright © 2017년 sally. All rights reserved.
//

import UIKit
import Cosmos

class AppDetailViewController: UIViewController {

    var appId: String?
    var viewModel: AppDetailViewModel?
    
    @IBOutlet var titleView: UIView!
    @IBOutlet var screenShotView: UIView!
    @IBOutlet var descriptionView: UIView!
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var artistNameLabel: UILabel!
    @IBOutlet var starRatingView: CosmosView!
    @IBOutlet var descriptionTitleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    @IBOutlet var descriptionHeightConstraint: NSLayoutConstraint!
    @IBOutlet var descriptionVerticalConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let appId = appId {
            viewModel = AppDetailViewModel(appId: appId)
            viewModel?.delegate = self
        }
    }
}

extension AppDetailViewController: ViewModelDelegate {
    
    func reloadView() {
        setTitleView()
        setScreenShotView()
        setDescriptionView()
    }
    
    private func setTitleView() {
        guard let viewModel = viewModel else { return }
        
        iconImageView.af_setImage(withURL: viewModel.icon!)
        nameLabel.text = viewModel.name
        artistNameLabel.text = viewModel.artistName
        starRatingView.rating = viewModel.rating!
        starRatingView.text = "(\(viewModel.ratingCount!))"
    }
    
    private func setScreenShotView() {
        guard let viewModel = viewModel else { return }
    }
    
    private func setDescriptionView() {
        guard let viewModel = viewModel else { return }
        contentLabel.text = viewModel.description
        contentLabel.sizeToFit()
        descriptionHeightConstraint.constant = descriptionTitleLabel.frame.height + descriptionVerticalConstraint.constant + contentLabel.frame.height
    }
}
