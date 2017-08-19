//
//  CategoryListContract.swift
//  RecieptBin
//
//  Created by Satish Birajdar on 2017-08-13.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import Foundation

struct CategoryViewDataModel{
    let name: String
}

protocol CategoryPresenterView: AnyObject{
    
    func displayCategories(categories: [CategoryViewDataModel])
    
}


//protocol CategoryPresentor{
//    func attachView(view: CategoryPresenterView)
//    func loadCategories()
//}


