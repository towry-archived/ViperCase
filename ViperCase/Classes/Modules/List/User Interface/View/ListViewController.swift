//
//  ListViewController.swift
//  case
//
//  Created by towry on 2018/2/22.
//  Copyright © 2018年 towry. All rights reserved.
//

import UIKit

let ListEntryCellIdentifier = "ListEntryCell"

class ListViewController:  UITableViewController  {
    @IBOutlet weak var noContentView: UIView?
    public var eventHandler: ListModuleInterface?
//    fileprivate var data:
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureView() {
        self.navigationItem.title = "VIPER TODO"
        let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton(sender:)))
        self.navigationItem.rightBarButtonItem = addBtn
    }
    
    @objc func didTapAddButton(sender: Any) {
        print("OK")
    }
}

// MARK: - UITableViewDelegate and DataSource method

extension ListViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
//        return self.data
    }
}

// MARK: - Extension ListViewInterface

extension ListViewController: ListViewInterface {
    
    func showNoContentMessage() {
        self.view = self.noContentView
    }
    
    func showUpcomingDisplayData(_ data: String) {
        // pass
    }
    
    func reloadEntries() {
        self.tableView.reloadData()
    }
}
