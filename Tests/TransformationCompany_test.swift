//
//  Tests.swift
//  Tests
//
//  Created by David Kwok Ho Chan on 4/17/17.
//  Copyright © 2017 David Kwok Ho Chan. All rights reserved.
//

import XCTest

class TransformationCompany_test: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDetermineWinnerScenOne() {
        
        var company = TransformationCompany.init();
        var robotOne = Transformer.init(name: "Ada");
        var robotTwo = Transformer.init(name: "Bobby");
        robotTwo.courage = 4;
        robotTwo.strength = 3;
        let result = company.determineWinner(robotA: robotOne, robotB: robotTwo);
        XCTAssertEqual(robotTwo.name, result?.name)
        
    }
    
    func testDetermineWinnerScenTwo() {
        
        var company = TransformationCompany.init();
        var robotOne = Transformer.init(name: "Ada");
        var robotTwo = Transformer.init(name: "Bobby");
        robotOne.skill = 3;
        let result = company.determineWinner(robotA: robotOne, robotB: robotTwo);
        XCTAssertEqual(robotOne.name, result?.name)
        
    }
    
    func testDetermineWinnerScenThree() {
        
        var company = TransformationCompany.init();
        var robotOne = Transformer.init(name: "Ada");
        var robotTwo = Transformer.init(name: "Bobby");
        robotOne.skill = 1;
        robotOne.courage = 2;
        robotOne.endurance = 3;
        let result = company.determineWinner(robotA: robotOne, robotB: robotTwo);
        XCTAssertEqual(robotOne.name, result?.name)
        
    }
    
    func testDetermineWinnerScenFour() {
        
        var company = TransformationCompany.init();
        var robotOne = Transformer.init(name: "Ada");
        var robotTwo = Transformer.init(name: "Bobby");
        robotTwo.skill = 1;
        robotTwo.courage = 2;
        robotTwo.endurance = 3;
        let result = company.determineWinner(robotA: robotOne, robotB: robotTwo);
        XCTAssertEqual(robotTwo.name, result?.name)
        
    }
    
    func testDetermineWinnerScenFive() {
        
        var company = TransformationCompany.init();
        var robotOne = Transformer.init(name: "Ada");
        var robotTwo = Transformer.init(name: "Bobby");
        let result = company.determineWinner(robotA: robotOne, robotB: robotTwo);
        XCTAssertNil(result)
        
    }
    
    func testComputeOutput() {
        var robots : [Transformer] = []
        
        robots.append(Transformer.init(name: "Ada"))
        robots.append(Transformer.init(name: "Bobby"))
        robots.append(Transformer.init(name: "Candy"))
        
        var company = TransformationCompany.init();
        let result = company.computeNumberOfBattles(robots: robots);
        let expected = 123;
        XCTAssertEqual(result, expected)
    }
    
}
