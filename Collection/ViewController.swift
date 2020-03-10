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

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.postData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        if let c = cell as? ViewCollectionViewCell {
            let m = model.postData[indexPath.row]
            c.titleLabel.text = m.title
            c.nameLabel.text = m.user.name
            c.coverImageView.sd_setImage(with: m.cover.url, completed: nil)
            c.userCoverImageView.sd_setImage(with: m.user.cover, placeholderImage: UIImage(systemName: "person.crop.circle"))
            
            c.likesLabel.text = "\(m.likes)"
        }
        
        return cell
    }

}

