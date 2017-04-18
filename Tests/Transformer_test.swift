//
//  Transformer_test.swift
//  Aequilirum
//
//  Created by David Kwok Ho Chan on 4/18/17.
//  Copyright © 2017 David Kwok Ho Chan. All rights reserved.
//

import XCTest
@testable import Aequilirum

class Transformer_test: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testComputerOverAllRating(){
        var mach = Transformer.init();
        mach.strength = 3;
        mach.intelligence = 3;
        mach.speed = 3;
        mach.endurance = 3;
        mach.firepower = 3;
        let result = mach.computerOverAllRating();
        let expected = mach.strength + mach.intelligence + mach.speed + mach.endurance + mach.firepower;
        XCTAssertEqual(result, expected)
    }
    
}

