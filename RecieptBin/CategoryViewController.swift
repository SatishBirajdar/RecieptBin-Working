//
//  ViewController.swift
//  RecieptBin
//
//  Created by Satish Birajdar on 2017-08-10.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import UIKit


class CategoryViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
  
    let categoryPresenter = CategoryPresenter(categoryService: CategoryService())
     var categoriesToDisplay = [CategoryViewDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self
        
        categoryPresenter.attachView(view: self as CategoryPresenterView)
        categoryPresenter.getCategories()
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return categoriesToDisplay.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "UserCell")
//        let userViewData = categoriesToDisplay[indexPath.row]
//        cell.textLabel?.text = userViewData.name
//        return cell
//    }
    
}

extension CategoryViewController: CategoryPresenterView {
    
    func displayCategories(categories: [CategoryViewDataModel]) {
        categoriesToDisplay = categories
        tableView?.reloadData()
    }
    
}


extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "UserCell")
        let categoryViewData = categoriesToDisplay[indexPath.row]
        cell.textLabel?.text = categoryViewData.name
        
//        cell.textLabel
        return cell
    }
}
