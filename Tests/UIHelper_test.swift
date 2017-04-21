//
//  UIHelper_test.swift
//  Aequilirum
//
//  Created by David Kwok Ho Chan on 4/20/17.
//  Copyright © 2017 David Kwok Ho Chan. All rights reserved.
//
import XCTest
@testable import Aequilirum

class UIHelper_test : XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIsCorrectInput(){
        
        let helper = UIHelper.init()
        var passingInput = ["1","5", "10"]
        for item in passingInput{
            XCTAssertTrue(helper.isCorrectInput(value: item))
        }
        var failingInput = ["0", "11", "" , "M", "n"
        ]
        for item in failingInput{
            XCTAssertFalse(helper.isCorrectInput(value: item))
        }
    }
    
    func testIsIntergerValue(){
        
        let helper = UIHelper.init()
        var input : Character = "1"
        var result = helper.isIntergerValue(value: input)
        XCTAssertEqual(result, true)
        input = "M"
        result = helper.isIntergerValue(value: input)
        XCTAssertEqual(result, false)
        input = "0"
        result = helper.isIntergerValue(value: input)
        XCTAssertEqual(result, true)
        input = "/"
        result = helper.isIntergerValue(value: input)
        XCTAssertEqual(result, false)
        input = ":"
        result = helper.isIntergerValue(value: input)
        XCTAssertEqual(result, false)
    }
}
