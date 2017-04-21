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
    
    func testDetermineWinnerFromSample() {
        let company = TransformationCompany.init()
        //Soundwave,D,8,9,2,6,7,5,6,10
        let soundWave = Transformer.init(name: "Soundwave")
        soundWave.machineType = Transformer.type.Decepticon
        soundWave.strength = 8
        soundWave.intelligence = 9
        soundWave.speed = 2
        soundWave.endurance = 6
        soundWave.rank = 7
        soundWave.courage = 5
        soundWave.firepower = 6
        soundWave.skill = 10
        //Bluestreak,A,6,6,7,9,5,2,9,7
        let blueStreak = Transformer.init(name: "Bluestreak")
        blueStreak.machineType = Transformer.type.Autobot
        blueStreak.strength = 6
        blueStreak.intelligence = 6
        blueStreak.speed = 7
        blueStreak.endurance = 9
        blueStreak.rank = 5
        blueStreak.courage = 2
        blueStreak.firepower = 9
        blueStreak.skill = 7
        let result = company.determineWinner(robotA: soundWave, robotB: blueStreak)
        XCTAssertEqual(result?.name, "Soundwave")
        
    }
    func testComputeNumberOfBattles() {
        
        var robots = generateRobots(name1 : "ADA" ,name2: "Bobby", name3: "Candy");
        var company = TransformationCompany.init();
        let result = company.computeBattleResult(robots: robots);
        let expectedBattles = 1;
        let expectedAutobotWins = 0;
        let expectedDecepticonWins = 1;
        XCTAssertEqual(result.battleCounts, expectedBattles)
        XCTAssertEqual(result.autoBotVictories, expectedAutobotWins)
        XCTAssertEqual(result.decepticonVictories, expectedDecepticonWins)
        
    }
    
    func testComputeNumberOfBattlesWithPrimes(){
    
        var robots = generateRobots(name1: "Optimus Prime", name2: "Predaking", name3: "Optimus Prime");
        var company = TransformationCompany.init();
        let result = company.computeBattleResult(robots: robots);
        XCTAssertEqual(result.worldEnd, true)
        
    }
    
    func testComputeNumberOfBattlesWithTies(){
        
        var robots = generateOtherRobots(name1: "Bumble", name2: "Rat");
        var company = TransformationCompany.init();
        let result = company.computeBattleResult(robots: robots);
        XCTAssertEqual(result.worldEnd, false)
        XCTAssertEqual(result.autoBotVictories, result.decepticonVictories)
        
    }
    
    func testComputBattleResultFromSample(){
        
        var input = generateSampleRobots()
        var company = TransformationCompany.init()
        let result = company.computeBattleResult(robots: input)
        XCTAssertEqual(result.battleCounts, 1)
        XCTAssertEqual(result.losingTeam?.count, 1)
        result.displayResult()
        
    }
    
    func generateSampleRobots() -> [Transformer] {
        
        var result : [Transformer] = []
        //Soundwave,D,8,9,2,6,7,5,6,10
        let soundWave = Transformer.init(name: "Soundwave")
        soundWave.machineType = Transformer.type.Decepticon
        soundWave.strength = 8
        soundWave.intelligence = 9
        soundWave.speed = 2
        soundWave.endurance = 6
        soundWave.rank = 7
        soundWave.courage = 5
        soundWave.firepower = 6
        soundWave.skill = 10
        result.append(soundWave)
        //Bluestreak,A,6,6,7,9,5,2,9,7
        let blueStreak = Transformer.init(name: "Bluestreak")
        blueStreak.machineType = Transformer.type.Autobot
        blueStreak.strength = 6
        blueStreak.intelligence = 6
        blueStreak.speed = 7
        blueStreak.endurance = 9
        blueStreak.rank = 5
        blueStreak.courage = 2
        blueStreak.firepower = 9
        blueStreak.skill = 7
        result.append(blueStreak)
        //Hubcap,A, 4,4,4,4,4,4,4,4
        let hubcap = Transformer.init(name: "hubcap")
        hubcap.machineType = Transformer.type.Autobot
        hubcap.strength = 4
        hubcap.intelligence = 4
        hubcap.speed = 4
        hubcap.endurance = 4
        hubcap.rank = 4
        hubcap.courage = 4
        hubcap.firepower = 4
        hubcap.skill = 4
        result.append(hubcap)
        return result
    }
    
    //HELPERS
    
    func generateRobots(name1 : String , name2 : String , name3 : String) -> [Transformer] {
        var robots : [Transformer] = [];
        let robotOne = Transformer.init(name: name1);
        robotOne.courage = 1 ;
        robotOne.skill = 1 ;
        robotOne.firepower = 2 ;
        robotOne.machineType = Transformer.type.Autobot;
        robots.append(robotOne);
        let robotTwo = Transformer.init(name: name2)
        robotTwo.courage = 3 ;
        robotTwo.skill = 1 ;
        robotTwo.firepower = 6 ;
        robotTwo.machineType = Transformer.type.Decepticon;
        robots.append(robotTwo);
        let robotThree = Transformer.init(name: name3)
        robotThree.courage = 2 ;
        robotThree.skill = 2 ;
        robotThree.firepower = 3 ;
        robotThree.machineType = Transformer.type.Autobot;
        robots.append(robotThree);
        return robots;
    }
    
    func generateOtherRobots(name1 : String , name2 : String) -> [Transformer]{
        var robots : [Transformer] = [];
        let robotOne = Transformer.init(name: name1);
        robotOne.courage = 1 ;
        robotOne.skill = 1 ;
        robotOne.firepower = 1 ;
        robotOne.machineType = Transformer.type.Autobot;
        robots.append(robotOne);
        let robotTwo = Transformer.init(name: name2)
        robotTwo.courage = 1 ;
        robotTwo.skill = 1 ;
        robotTwo.firepower = 1 ;
        robotTwo.machineType = Transformer.type.Decepticon;
        robots.append(robotTwo);
        return robots;
    }
    
}
