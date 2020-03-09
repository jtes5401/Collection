//
//  ViewControllerModel.swift
//  Collection
//
//  Created by Wei Kuo on 2020/3/9.
//  Copyright © 2020 Wei Kuo. All rights reserved.
//

import Foundation

class ViewControllerModel {
    public var postData = [SocialPost]()
    
    public var onUpdate:((_ isFinish:Bool)->Void)?
    
    private let count = 10
    private var current = 1
    private var noMore = false
    private var connect = SocialConnection()
    
    
    func updatePostData() {
        if noMore {
            return
        }
        
        onUpdate?(false)
        connect.requestSocialPosts(limit: count, pageNum: current) { [unowned self] (data, result) in
            if result,let d = data {
                self.postData.append(contentsOf: d.datas)
                self.noMore = !d.hasMore
                self.current = d.currentPage+1
            }
            DispatchQueue.main.async {
                self.onUpdate?(true)
            }
        }
    }
}
