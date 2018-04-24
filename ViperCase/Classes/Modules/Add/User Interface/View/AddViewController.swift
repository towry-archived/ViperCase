//
//  AddViewController.swift
//  ViperCase
//
//  Created by towry on 2018/4/24.
//  Copyright © 2018年 towry. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    var eventHandler: AddModuleInterface?
    var transitioningBackgroundView: UIView?
    var minimuDate: Date?
    
    @IBOutlet weak var nameTextField: UITextField?
    @IBOutlet weak var datePicker: UIDatePicker?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension AddViewController: AddViewInterface {
    func setEntryName(name: String) {
        self.nameTextField?.text = name
    }
    
    func setEntryDueDate(date: Date) {
        self.datePicker?.setDate(date, animated: true)
    }
    
    func setMinimumDueDate(date: Date) {
        self.minimuDate = date
    }
}
