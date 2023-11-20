//
//  Cart.swift
//  AleloProductsTests
//
//  Created by Renato Nascimento on 20/11/23.
//

import XCTest

final class CartTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTotalPrice() {
        let cart = Cart()
        let item1 = MockData.cartItemOne
        let item2 = MockData.cartItemTwo

        cart.add(item1)
        cart.add(item2)

        XCTAssertEqual(cart.totalPrice, 1 * 119.90 + 1 * 199.90, accuracy: 0.001)
    }

    func testTotalChangeQuantity() {
        let cart = Cart()
        var item1 = MockData.cartItemOne
        var item2 = MockData.cartItemTwo

        item1.increment()
        
        cart.add(item1)
        cart.add(item2)
        
        XCTAssertEqual(cart.totalPrice, 1 * 119.90 + 2 * 199.90, accuracy: 0.001)
    }
}
