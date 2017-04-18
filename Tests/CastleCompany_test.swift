//
//  Tests.swift
//  Tests
//
//  Created by David Kwok Ho Chan on 4/17/17.
//  Copyright © 2017 David Kwok Ho Chan. All rights reserved.
//

import XCTest
@testable import Aequilirum

class CastleCompany_test: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNumberOfCastle() {
        let company = CastleCompany.init();
        let array : [Int] = [1 ,2, 3 , 2 ,1 ,2 ,3 , 2];
        let expected = 3;
        let result = company.numberOfCastle(land: array);
        XCTAssertEqual(expected, result);
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
