//
//  CircleImageView.swift
//  Collection
//
//  Created by Wei Kuo on 2020/3/10.
//  Copyright © 2020 Wei Kuo. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {

    override func didMoveToSuperview() {
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}
