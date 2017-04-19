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
    
    func testComputeNumberOfBattles() {
        
        var robots = generateRobots();
        var company = TransformationCompany.init();
        let result = company.computeNumberOfBattles(robots: robots);
        let expectedBattles = 2;
        XCTAssertEqual(result.battleCounts, expectedBattles)
    }
    
    func generateRobots() -> [Transformer] {
        var robots : [Transformer] = [];
        let robotOne = Transformer.init(name: "Ada");
        robotOne.courage = 1 ;
        robotOne.skill = 2 ;
        robotOne.firepower = 3 ;
        robotOne.machineType = Transformer.type.Autobot;
        robots.append(robotOne);
        let robotTwo = Transformer.init(name: "Bobby")
        robotTwo.courage = 3 ;
        robotTwo.skill = 1 ;
        robotTwo.firepower = 6 ;
        robotTwo.machineType = Transformer.type.Deception;
        robots.append(robotTwo);
        let robotThree = Transformer.init(name: "Candy")
        robotThree.courage = 2 ;
        robotThree.skill = 2 ;
        robotThree.firepower = 3 ;
        robotThree.machineType = Transformer.type.Autobot;
        robots.append(robotThree);
        return robots;
    }
    
}
