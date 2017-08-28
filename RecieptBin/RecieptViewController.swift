//
//  ViewController.swift
//  RecieptBin
//
//  Created by Satish Birajdar on 2017-08-10.
//  Copyright © 2017 SBSoftwares. All rights reserved.
//

import UIKit


class RecieptViewController: UIViewController  {

    let cellIdentifier = "cell"
    @IBOutlet var tableView: UITableView!
    
     var reciepts: Array<RecieptViewDataModel> = []
    lazy var RecieptListPresenter: RecieptPresenter = {
        return RecieptPresenterImpl()
    }()
    
    init(){
        super.init(nibName: "RecieptListView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView.register(UINib(nibName: "RecieptListCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        RecieptListPresenter.attachView(view: self as RecieptPresenterView)
    }
}

extension RecieptViewController: RecieptPresenterView {
    func displayReciepts(reciepts: Array<RecieptViewDataModel>) {
        self.reciepts = reciepts
        tableView?.reloadData()
    }

}


extension RecieptViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reciepts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recieptViewData = reciepts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RecieptListCell
        cell.categoryNameLabel?.text = recieptViewData.name

        return cell
    }
}

extension RecieptViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

