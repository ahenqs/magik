//
//  HomeViewController.swift
//  Magik
//
//  Created by André Henrique da Silva on 25/10/2017.
//  Copyright © 2017 André Henrique da Silva. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataManager: ProductManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {

        let items = Database.shared.items.orderByPrice()

        dataManager = ProductManager(items: items)

        tableView.delegate = dataManager
        tableView.dataSource = dataManager

        title = "Products"

        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
    
}

