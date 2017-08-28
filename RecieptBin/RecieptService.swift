//
//  CategoryService.swift
//  RecieptBin
//
//  Created by Satish Birajdar on 2017-08-13.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import Foundation
import PromiseKit

protocol RecieptService{
    func getReciepts() -> Array <Reciept>
}

class RecieptServiceImpl: RecieptService {
    
    func getReciepts() -> Array <Reciept>{

        let reciepts = [Reciept(firstName:"Satish", lastName:"Birajdar"),
                          Reciept(firstName:"Nikhil", lastName:"Dekosta")]
       
        return reciepts
    }    
}
