//
//  CategoryPresenterTest.swift
//  RecieptBin
//
//  Created by Satish Birajdar on 2017-08-26.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import XCTest
@testable import RecieptBin

class CategoryPresenterTest: XCTestCase {
    
    private var subject: CategoryPresenter!
    private var view: CategoryListViewSpy!
    
    var displayCount = 0
    
    override func setUp() {
        super.setUp()
        
        view = CategoryListViewSpy()
        subject = CategoryPresenterImpl()
        
        subject.attachView(view: view)
    }
    
    
    func testDisplayCategories() {
       XCTAssertEqual(view.categoriesCount, 1)
    }
    
    
}

class CategoryListViewSpy: CategoryPresenterView {
    
    var categoriesCount = 0
    
    func displayCategories(categories: Array<CategoryViewDataModel>) {
        categoriesCount += 1
    }

}
