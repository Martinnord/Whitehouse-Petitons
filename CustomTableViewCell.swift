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

        labelBackgroundView.layer.borderColor = UIColor.white.cgColor
        labelBackgroundView.layer.borderWidth = 1.0
        labelBackgroundView.layer.cornerRadius = 3.0
        labelBackgroundView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        labelBackgroundView.layer.shadowOpacity = 0.8
        labelBackgroundView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        labelBackgroundView.layer.masksToBounds = true
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
