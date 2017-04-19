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
    
    func testNumberOfCastleOne() {
        let company = CastleCompany.init();
        let array : [Int] = [1];
        let expected = 1;
        let result = company.numberOfCastle(land: array);
        XCTAssertEqual(expected, result);
    }
    
    func testNumberOfCastleTwo() {
        let company = CastleCompany.init();
        let array : [Int] = [1 ,2, 3 , 2 ,1 ,2 ,3 , 2];
        let expected = 4;
        let result = company.numberOfCastle(land: array);
        XCTAssertEqual(expected, result);
    }
    
    func testNumberOfCastleThree() {
        let company = CastleCompany.init();
        let array : [Int] = [1 , 2 , 1 , 2 , 1];
        let expected = 4;
        let result = company.numberOfCastle(land: array);
        XCTAssertEqual(expected, result);
    }
}
