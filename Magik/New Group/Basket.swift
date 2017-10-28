//
//  Basket.swift
//  Magik
//
//  Created by André Henrique da Silva on 28/10/2017.
//  Copyright © 2017 André Henrique da Silva. All rights reserved.
//

import Foundation

typealias SimpleComplationHandler = (_ success: Bool, _ error: Error?) -> ()

struct Basket {
    
    static var shared = Basket()
    
    private init() {
        items = retrieve()
    }
    
    var items: Products!
    
    @discardableResult
    func save() -> Bool {
        // should save basket online or database
        return true
    }
    
    func retrieve() -> Products {
        // should get products from basket saved online or from database
        return []
    }
    
    mutating func add(_ product: Product, completionHandler: SimpleComplationHandler) {
        items.append(product)
        completionHandler(true, nil)
    }
    
    mutating func remove(_ product: Product, completionHandler: SimpleComplationHandler) {
        
        if items.contains(product), let index = items.index(of: product) {
            items.remove(at: index)
        }
        
        completionHandler(true, nil)
    }
}
