//
//  ViewController.swift
//  RecieptBin
//
//  Created by Satish Birajdar on 2017-08-10.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import UIKit


class CategoryViewController: UIViewController  {

    @IBOutlet var tableView: UITableView!
    
     var categories: Array<CategoryViewDataModel> = []
    lazy var categoryListPresenter: CategoryPresentor = {
        return CategoryPresenterImpl()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.dataSource = self
        
        categoryListPresenter.attachView(view: self as CategoryPresenterView)
    }
}

extension CategoryViewController: CategoryPresenterView {
    
    func displayCategories(categories: [CategoryViewDataModel]) {
        self.categories = categories
        tableView?.reloadData()
    }
}


extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "UserCell")
        let categoryViewData = categories[indexPath.row]
        cell.textLabel?.text = categoryViewData.name
        
        return cell
    }
}
