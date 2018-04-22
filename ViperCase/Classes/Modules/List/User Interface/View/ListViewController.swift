//
//  ListViewController.swift
//  case
//
//  Created by towry on 2018/2/22.
//  Copyright © 2018年 towry. All rights reserved.
//

import UIKit

let ListEntryCellIdentifier = "ListEntryCell"

class ListViewController: UITableViewController  {
    @IBOutlet weak var noContentView: UIView?
    public var eventHandler: ListModuleInterface?
    fileprivate var data: UpcomingDisplayData?
    fileprivate var strongTableView: UITableView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.strongTableView = self.tableView
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
        print("tap")
        if self.eventHandler == nil {
            print("Nil")
        }
        self.eventHandler?.addNewEntry()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.eventHandler?.updateView()
    }
}

// MARK: - UITableViewDelegate and DataSource method

extension ListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let data = self.data else {
            return 0
        }
        
        return data.sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = self.data else {
            return 0
        }
        
        let upcomingSection = data.sections[section]
        return upcomingSection.items.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let data = self.data else {
            return ""
        }
        
        let upcomingSection = data.sections[section]
        return upcomingSection.name
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = self.data else {
            return self.tableView.dequeueReusableCell(withIdentifier: ListEntryCellIdentifier)!
        }
        
        let section = data.sections[indexPath.section]
        let item = section.items[indexPath.row]
        
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: ListEntryCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.dueDay
        cell.imageView?.image = UIImage(named: section.imageName)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
}

// MARK: - Extension ListViewInterface

extension ListViewController: ListViewInterface {
    
    func showNoContentMessage() {
        print("showNoContentMessage")
        self.view = self.noContentView
    }
    
    func showUpcomingDisplayData(_ data: UpcomingDisplayData) {
        self.view = self.strongTableView!
        self.data = data
        self.reloadEntries()
    }
    
    func reloadEntries() {
        self.tableView.reloadData()
    }
}
