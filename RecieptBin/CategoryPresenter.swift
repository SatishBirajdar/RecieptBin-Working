//
//  CategoryPresenter.swift
//  RecieptBin
//
//  Created by Satish Birajdar on 2017-08-13.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

class CategoryPresenter {
    private let categoryService:CategoryService
    weak private var categoryView : CategoryPresenterView?
    
    init(categoryService:CategoryService){
        self.categoryService = categoryService
    }
    
    func attachView(view:CategoryPresenterView){
        categoryView = view
    }
    
    func detachView() {
        categoryView = nil
    }
    
    func getCategories(){

    if let categoriess: Array<Category> = categoryService.getCategories() {
        if(categoriess.count == 0){
            print("Empty category list")
        }else{
            
            let mappedCategories = categoriess.map{ item in
                return CategoryViewDataModel(name: "\(item.firstName) \(item.lastName)")
            }
            self.categoryView?.displayCategories(categories: mappedCategories)
            print("Not Empty category list")
            
        }
        
    }
  }
}
