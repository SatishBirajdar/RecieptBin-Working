//
//  RecieptPresenterTest.swift
//  RecieptBin
//
//  Created by Satish Birajdar on 2017-08-26.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import XCTest
@testable import RecieptBin

class RecieptPresenterTest: XCTestCase {
    
    private var subject: RecieptPresenter!
    private var view: RecieptListViewSpy!
    
    var displayCount = 0
    
    override func setUp() {
        super.setUp()
        
        view = RecieptListViewSpy()
        subject = RecieptPresenterImpl()
        
        subject.attachView(view: view)
    }
    
    
    func testDisplayCategories() {
       XCTAssertEqual(view.recieptsCount, 1)
    }
    
    
}

class RecieptListViewSpy: RecieptPresenterView {
    
    var recieptsCount = 0
    
    func displayReciepts(reciepts: Array<RecieptViewDataModel>) {
        recieptsCount += 1
    }

}
