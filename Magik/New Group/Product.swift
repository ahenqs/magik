//
//  Product.swift
//  Magik
//
//  Created by André Henrique da Silva on 25/10/2017.
//  Copyright © 2017 André Henrique da Silva. All rights reserved.
//

import Foundation

protocol Marchadise {
    var name: String! { get set }
    var price: Double! { get set }
}

struct Product: Marchadise, Equatable {
    var name: String!
    var price: Double!
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
    
    var viewModel: ProductViewModel {
        return ProductViewModel(model: self)
    }
    
    var description: String {
        let viewModel = self.viewModel
        
        return viewModel.name + " - " + viewModel.price
    }
    
    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price
    }
}

struct ProductViewModel {
    
    var name: String!
    var price: String!
    
    init(model: Product) {
        name = model.name
        price = String(format: "$%.02f", model.price)
    }
}
