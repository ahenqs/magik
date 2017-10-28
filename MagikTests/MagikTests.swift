//
//  MagikTests.swift
//  MagikTests
//
//  Created by André Henrique da Silva on 28/10/2017.
//  Copyright © 2017 André Henrique da Silva. All rights reserved.
//

import XCTest

@testable import Magik

class MagikTests: XCTestCase {
    
    var controllerUnderTest: HomeViewController!
    
    override func setUp() {
        super.setUp()
        
        controllerUnderTest = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    }
    
    override func tearDown() {
        
        controllerUnderTest = nil
        
        super.tearDown()
    }
    
    func testNumberOfItems() {
        
        _ = controllerUnderTest.view
        
        let dataManager = controllerUnderTest.dataManager
        
        let items = Database.shared.items

        XCTAssertTrue(dataManager?.items.count == items.count, "Number of items should be the same -> \(items.count).")
    }
    
    func testOrderByName() {
        
        controllerUnderTest.items = Database.shared.items.orderByName()
        
        _ = controllerUnderTest.view
        
        let dataManager = controllerUnderTest.dataManager
        
        XCTAssertTrue(dataManager?.items.first?.name.lowercased() == "product a", "Product name should be Product A.")
        XCTAssertTrue(dataManager?.items.last?.name.lowercased() == "product l", "Product name should be Product L.")
    }
    
    func testOrderByPriceAscending() {
        
        controllerUnderTest.items = Database.shared.items.orderByPrice()
        
        _ = controllerUnderTest.view
        
        let dataManager = controllerUnderTest.dataManager
        
        XCTAssertTrue(dataManager?.items.first?.price == 0.29, "Price should be $0.29")
        XCTAssertTrue(dataManager?.items.last?.price == 14.37, "Price should be $14.37")
    }
    
    func testOrderByPriceDescending() {
        
        controllerUnderTest.items = Database.shared.items.orderByPrice(ascending: false)
        
        _ = controllerUnderTest.view
        
        let dataManager = controllerUnderTest.dataManager
        
        XCTAssertTrue(dataManager?.items.first?.price == 14.37, "Price should be $14.37")
        XCTAssertTrue(dataManager?.items.last?.price == 0.29, "Price should be $0.29")
    }
    
    func DidSelectRow() {
        
    }
    
    func testDidTappedActionButton() {
        
        controllerUnderTest.items = Database.shared.items.orderByName()
        
        _ = controllerUnderTest.view
        
        let indexPath = IndexPath(row: 0, section: 0)

        let firstCell = controllerUnderTest.dataManager.tableView(controllerUnderTest.tableView, cellForRowAt: indexPath) as! Cell
        
        firstCell.buyButtonTapped(firstCell.actionButton)
        
        XCTAssertTrue(Basket.shared.items.count == 1, "Should be 1 item in Basket.")
        
    }
    
}
