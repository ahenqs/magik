//
//  Database.swift
//  Magik
//
//  Created by André Henrique da Silva on 25/10/2017.
//  Copyright © 2017 André Henrique da Silva. All rights reserved.
//

import Foundation

typealias Products = [Product]

class Database {
    
    static let shared = Database()
    
    private init() {}
    
    var items: [Product] {
        
        return [Product(name: "Product A", price: 0.99), Product(name: "Product B", price: 1.22), Product(name: "Product C", price: 4.87),
                Product(name: "Product D", price: 0.78), Product(name: "Product E", price: 1.99), Product(name: "Product F", price: 0.58),
                Product(name: "Product G", price: 0.29), Product(name: "Product H", price: 3.62), Product(name: "Product I", price: 14.37),
                Product(name: "Product J", price: 0.39), Product(name: "Product K", price: 6.54), Product(name: "Product L", price: 9.99)]
        
    }
}

extension Array where Element: Marchadise {
    
    func orderByName(ascending: Bool = true) -> Products {
        
        return self.sorted(by: { ascending ? $0.name < $1.name : $0.name > $1.name }) as! Products
    }
    
    func orderByPrice(ascending: Bool = true) -> Products {
        
        return self.sorted(by: { ascending ? $0.price < $1.price : $0.price > $1.price }) as! Products
    }
}
