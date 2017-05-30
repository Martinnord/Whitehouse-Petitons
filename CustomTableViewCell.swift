//
//  CustomTableViewCell.swift
//  Whitehouse Petitions
//
//  Created by Martin Nordström on 2017-05-30.
//  Copyright © 2017 Martin Nordström. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var labelBackgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        labelBackgroundView.layer.borderWidth = 0.5
        labelBackgroundView.layer.borderColor = UIColor.lightGray.cgColor
        labelBackgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        labelBackgroundView.layer.shadowOpacity = 0.8
        labelBackgroundView.layer.shadowRadius = 1.0
        labelBackgroundView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        labelBackgroundView.layer.masksToBounds = false;
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
