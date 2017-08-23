//
//  CategoryService.swift
//  RecieptBin
//
//  Created by Satish Birajdar on 2017-08-13.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import Foundation

protocol CategoryService{
    func getCategories() -> Array <Category>
}

class CategoryServiceImpl: CategoryService {
    
    func getCategories() -> Array <Category>{
        let categories = [Category(firstName:"Satish", lastName:"Birajdar"),
                          Category(firstName:"Nikhil", lastName:"Dekosta")]
       
        return categories
    }    
}
