//
//  CategoryPresenter.swift
//  RecieptBin
//
//  Created by Satish Birajdar on 2017-08-13.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import PromiseKit

class RecieptPresenterImpl: RecieptPresenter {
    private let recieptService:RecieptService
    weak private var recieptView : RecieptPresenterView?
    
    init(service: RecieptService = RecieptServiceImpl()){
        self.recieptService = service
    }
    
    func attachView(view:RecieptPresenterView){
        recieptView = view
        let reciepts = self.recieptService.getReciepts()
        self.recieptView?.displayReciepts(reciepts: (reciepts as? [RecieptViewDataModel])!)
    }

    func detachView() {
        recieptView = nil
    }
}

extension Reciept: RecieptViewDataModel {
    var name: String {
        return firstName + " " + lastName
    }
}
