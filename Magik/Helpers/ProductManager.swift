//
//  ProductManager.swift
//  Magik
//
//  Created by André Henrique da Silva on 25/10/2017.
//  Copyright © 2017 André Henrique da Silva. All rights reserved.
//

import UIKit

typealias ProductHandler = ((_ product: Product) -> ())

class ProductManager: NSObject {
    
    var items: Products = []

    private var handler: ProductHandler = { prod in

        Basket.shared.add(prod, completionHandler: { (success, error) in
            if success {
                print("Added \(prod.description)")
            }
        })
        
        print("\nTotal $\(Basket.shared.items.total())\n\nItems are:")
        print(Basket.shared.items)
    }

    convenience init(items: [Product]) {
        self.init()
        self.items = items
    }
}

// MARK: UITableViewDataSource methods
extension ProductManager: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        
        cell.product = items[indexPath.row]
        
        cell.buttonActionHandler = handler
        
        return cell
    }
}

// MARK: UITableViewDelegate methods
extension ProductManager: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {")
        print("\t" + items[indexPath.row].description)
        print("}\n")
    }
}
