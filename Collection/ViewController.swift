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
        
        if let layout = collectionView.collectionViewLayout as? PintersetLayout{
            layout.delegate = self
        }

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
        return model.postData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        if let c = cell as? ViewCollectionViewCell {
            let m = model.postData[indexPath.row]
            c.titleLabel.text = m.title
            c.nameLabel.text = m.user.name
            c.coverImageView.sd_setImage(with: m.cover.url)
            c.userCoverImageView.sd_setImage(with: m.user.cover, placeholderImage: UIImage(systemName: "person.crop.circle"))
            
            c.likesLabel.text = "\(m.likes)"
        }
        
        return cell
    }
}

extension ViewController : PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let width = (collectionView.frame.size.width - 30) / 2
        
        let m = model.postData[indexPath.row]
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17.0)
        label.numberOfLines = 30
        label.text = m.title
        
        let adSize = label.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
        
        let height = (width / CGFloat(m.cover.width / m.cover.height)) + 57 + adSize.height
        return height
    }
}

extension ViewController : UICollectionViewDelegate {    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row >= model.postData.count - 1 {
            model.updatePostData()
        }
    }
}
