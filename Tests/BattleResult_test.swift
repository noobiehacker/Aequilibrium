//
//  BattleResult_test.swift
//  Aequilirum
//
//  Created by David Kwok Ho Chan on 4/19/17.
//  Copyright © 2017 David Kwok Ho Chan. All rights reserved.
//

import XCTest
@testable import Aequilirum

class BattleResult_test: XCTestCase{
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDisplayResult() {
        
        let battleResult = generateBattleResult();
        battleResult.displayResult();
        
    }
    
    func testGenerateResultWithWorldEnd(){
        
        let battleResult = generateBattleResult();
        battleResult.worldEnd = true;
        let result = battleResult.generateResultMessage();
        let expected = "The game immediately ends with all competitors destroyed"
        XCTAssertEqual(result, expected)
    }
    
    func testGenerateWinningMessage() {
        
        let battleResult = generateBattleResult();
        let result = battleResult.generateWinningTeamMessage();
        let expected = "Winning team (AutoBots): Bumble Bee"
        XCTAssertEqual(result, expected)
        
    }
    
    func testGenerateSurvivorMessage(){
        
        let battleResult = generateBattleResult();
        let result = battleResult.generateSurvivorTeamMessage();
        let expected = "Survivors from the losing team (Decepticons): Flying Rat"
        XCTAssertEqual(result, expected)
    }
    
    //HELPERS
    
    func generateBattleResult() -> BattleResult{
        let winningTeam = [Transformer.init(name: "Bumble Bee")];
        let losingTeam = [Transformer.init(name: "Flying Rat")];
        let battleResult = BattleResult.init(battleCounts: 1, autoBotVictories: 2, decepticonVictories: 1, worldEnd: false, winningTeam: winningTeam, losingTeam: losingTeam)
        return battleResult;
    }
    
}
