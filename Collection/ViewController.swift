//
//  ViewController.swift
//  Collection
//
//  Created by Wei Kuo on 2020/3/9.
//  Copyright © 2020 Wei Kuo. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    let model = ViewControllerModel()

    @IBOutlet var collectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.onUpdate = onUpdate(isFinish:)
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        model.updatePostData()
    }
    
    func onUpdate(isFinish:Bool) {
        if isFinish {
            collectionView.reloadData()
        }
    }
    }


}

