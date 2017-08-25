//
//  CategoryPresenter.swift
//  RecieptBin
//
//  Created by Satish Birajdar on 2017-08-13.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import PromiseKit

class CategoryPresenterImpl: CategoryPresentor {
    private let categoryService:CategoryService
    weak private var categoryView : CategoryPresenterView?
    
    init(service: CategoryService = CategoryServiceImpl()){
        self.categoryService = service
    }
    
    func attachView(view:CategoryPresenterView){
        categoryView = view
        
//        firstly{
            categoryService.getCategories()
//        }
//        .then{_ in 
        
            let categories = self.categoryService.getCategories()
            self.categoryView?.displayCategories(categories: (categories as? [CategoryViewDataModel])!)
//        }
    }

    func detachView() {
        categoryView = nil
    }
}

extension Category: CategoryViewDataModel {
    var name: String {
        return firstName + " " + lastName
    }
}
