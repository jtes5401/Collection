//
//  ViewCollectionViewCell.swift
//  Collection
//
//  Created by Wei Kuo on 2020/3/9.
//  Copyright © 2020 Wei Kuo. All rights reserved.
//

import UIKit

class ViewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var coverImageView:UIImageView!
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var userCoverImageView:UIImageView!
    @IBOutlet var likeButton:UIButton!
    @IBOutlet var likesLabel:UILabel!
    
    override func prepareForReuse() {
        coverImageView.image = nil
        titleLabel.text = nil
        nameLabel.text = nil
        userCoverImageView.image = UIImage(named: "person.crop.circle")
    }
}
