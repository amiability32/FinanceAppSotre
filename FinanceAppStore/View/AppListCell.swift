//
//  AppListCell.swift
//  FinanceAppStore
//
//  Created by sally on 2017. 4. 10..
//  Copyright © 2017년 sally. All rights reserved.
//

import UIKit
import AlamofireImage

class AppListCell: UITableViewCell {
    
    @IBOutlet var rankLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    func load(id: Int, _ application: AppVO) {
        rankLabel.text = "\(id)"
        iconImageView.af_setImage(withURL: URL.init(string: application.iconUrl)!)
        titleLabel.text = application.title
    }
}
