//
//  ListViewController.swift
//  case
//
//  Created by towry on 2018/2/22.
//  Copyright © 2018年 towry. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    @IBOutlet weak var noContentView: UIView?
    var eventHandler: Optional<String>

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ListViewController: ListViewInterface {
    func showNoContentMessage() {
        // pass
    }
    
    func showUpcomingDisplayData(_ data: String) {
        // pass
    }
    
    func reloadEntries() {
        // pass
    }
}
