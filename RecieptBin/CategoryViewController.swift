//
//  ViewController.swift
//  RecieptBin
//
//  Created by Satish Birajdar on 2017-08-10.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import UIKit


class CategoryViewController: UIViewController  {

    let cellIdentifier = "cell"
    @IBOutlet var tableView: UITableView!
    
     var categories: Array<CategoryViewDataModel> = []
    lazy var categoryListPresenter: CategoryPresentor = {
        return CategoryPresenterImpl()
    }()
    
    init(){
        super.init(nibName: "CategoryListView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView.register(UINib(nibName: "CategoryListCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryViewData = categories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CategoryListCell
        cell.categoryNameLabel?.text = categoryViewData.name

        return cell
    }
}

extension CategoryViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

