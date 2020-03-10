//
//  CollectionTests.swift
//  CollectionTests
//
//  Created by Wei Kuo on 2020/3/9.
//  Copyright © 2020 Wei Kuo. All rights reserved.
//

import XCTest
@testable import Collection

class CollectionTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConnection() {
        let excep = XCTestExpectation(description: "Download data")
        
        SocialConnection().requestSocialPosts(limit: 222, pageNum: 1) { (posts, r) in
            assert(r, "Result err")
            print(posts)
            excep.fulfill()
        }
        
        wait(for: [excep], timeout: 10.0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
