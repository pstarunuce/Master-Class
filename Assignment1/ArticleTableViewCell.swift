//
//  ArticleTableViewCell.swift
//  Assignment1
//
//  Created by Pasuparthi Shubha Tarun on 21/06/19.
//  Copyright © 2019 Pasuparthi Shubha Tarun. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var summary: UITextField!
    @IBOutlet weak var label: UITextField!
    @IBOutlet weak var imageHolder: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        imageHolder.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleBottomMargin.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue | UIView.AutoresizingMask.flexibleRightMargin.rawValue | UIView.AutoresizingMask.flexibleLeftMargin.rawValue | UIView.AutoresizingMask.flexibleTopMargin.rawValue | UIView.AutoresizingMask.flexibleWidth.rawValue)
//        imageHolder.contentMode = UIView.ContentMode.scaleAspectFit
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
  }
    
}

