//
//  Connection.swift
//  Collection
//
//  Created by Wei Kuo on 2020/3/9.
//  Copyright © 2020 Wei Kuo. All rights reserved.
//

import UIKit

typealias Handler = (_ data:SocialData?,_ isSucc:Bool)->Void

class SocialConnection: NSObject {
    
    let session = URLSession.shared
    let host = "https://interview-api.kollectin.com"
    let decoder = JSONDecoder()
    
    public func requestSocialPosts(limit:Int, pageNum:Int, sort:String = "pop", callBack:Handler?) {
        let path = host + "/api/social/posts?sort=\(sort)&limit=\(limit)&pageNo=\(pageNum)"

        guard let url = URL(string: path) else { return }
        
        let req = URLRequest(url: url)
        
        session.dataTask(with: req) { (data, resp, err) in
            if let e = err {
                print("Error:",e)
                callBack?(nil, false)
                return
            }
            guard let d = data else {
                callBack?(nil,false)
                return
            }
            do {
                let result = try self.decoder.decode(SocialData.self, from: d)
                callBack?(result,true)
                return
            } catch let e as Error  {
                print("Error:",e)
                callBack?(nil,false)
            }
        }.resume()
    }

}
