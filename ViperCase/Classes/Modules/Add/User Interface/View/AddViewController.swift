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
    
    @IBAction func save(sender: Any) {
        guard let text = self.nameTextField?.text, let dueDate = self.datePicker?.date else {
            self.eventHandler?.cancelAddAction()
            return
        }
        
        if text.isEmpty {
            self.eventHandler?.cancelAddAction()
            return
        }

        self.eventHandler?.saveAddActionWithName(name: text, dueDate: dueDate)
    }
    
    @IBAction func cancel(sender: Any) {
        self.eventHandler?.cancelAddAction()
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
