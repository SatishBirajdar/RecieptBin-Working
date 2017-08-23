//
//  CategoryPresenter.swift
//  RecieptBin
//
//  Created by Satish Birajdar on 2017-08-13.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

class CategoryPresenterImpl: CategoryPresentor {
    private let categoryService:CategoryService
    weak private var categoryView : CategoryPresenterView?
    
    init(service: CategoryService = CategoryServiceImpl()){
        self.categoryService = service
    }
    
    func attachView(view:CategoryPresenterView){
        categoryView = view
        
        let categories: Array<Category> = categoryService.getCategories()
        categoryView?.displayCategories(categories: (categories as? [CategoryViewDataModel])!)
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
