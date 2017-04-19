//
//  BattleResult.swift
//  Aequilirum
//
//  Created by David Kwok Ho Chan on 4/18/17.
//  Copyright © 2017 David Kwok Ho Chan. All rights reserved.
//

import Foundation

class BattleResult{
    
    var battleCounts = 0;
    var autoBotVictories = 0;
    var decepticonVictories = 0;
    var worldEnd = false;
    var winningTeam : [Transformer]?
    var losingTeam : [Transformer]?
    
    //Add Init to fix constructor
    
    func displayResult(){
        
        print(String(battleCounts) + " battle");
        print("Winning team " + displayWinningTeam());
        print("Survivors from the losing team " + displayLosingTeam());
        
    }
    
    func displayWinningTeam() -> String{
        let lastRobot = winningTeam?.popLast()
        var result = ""
        result.append(String(describing: lastRobot?.machineType))
        result.append(" ")
        result.append((lastRobot?.name)!)
        for robot in winningTeam! {
            result.append(" ")
            result.append(robot.name)
        }
        return result
    }
    
    func displayLosingTeam() -> String{
        let lastRobot = losingTeam?.popLast()
        var result = ""
        result.append(String(describing: lastRobot?.machineType))
        result.append(" ")
        result.append((lastRobot?.name)!)
        for robot in winningTeam! {
            result.append(" ")
            result.append(robot.name)
        }
        return result
    }
    
}
