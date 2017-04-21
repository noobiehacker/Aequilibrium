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
    
    init(battleCounts : Int , autoBotVictories : Int , decepticonVictories: Int, worldEnd: Bool, winningTeam : [Transformer]?, losingTeam : [Transformer]?){
        self.battleCounts = battleCounts;
        self.autoBotVictories = autoBotVictories;
        self.decepticonVictories = decepticonVictories;
        self.worldEnd = worldEnd;
        self.winningTeam = winningTeam;
        self.losingTeam = losingTeam;
    }
    
    //Add Init to fix constructor
    func displayResult(){
        
        print(generateResultMessage());
        
    }
    
    func generateResultMessage() -> String{
        
        if worldEnd{
            return "The game immediately ends with all competitors destroyed"
        }else{
            var result = String(battleCounts) + " battle" + "\n";
            result.append(generateWinningTeamMessage()+"\n");
            result.append(generateSurvivorTeamMessage()+"\n");
            return result;
        }
        
    }
    
    func generateWinningTeamMessage() -> String{
        if autoBotVictories == decepticonVictories{
            return "Its A Tie"
        }else{
            let lastRobot = winningTeam?.popLast()
            var result = "Winning team "
            result.append("(")
            result.append(getWinningTeamName())
            result.append("): ")
            result.append((lastRobot?.name)!)
            for robot in winningTeam! {
                result.append(" ")
                result.append(robot.name)
            }
            return result
        }
    }
    
    func generateSurvivorTeamMessage() -> String{
        if losingTeam?.count == 0{
            return "No Survivor from the losing team"
        }else{
            let lastRobot = losingTeam?.popLast()
            var result = "Survivors from the losing team "
            result.append("(")
            result.append(getLosingTeamName())
            result.append("): ")
            result.append((lastRobot?.name)!)
            for robot in losingTeam! {
                result.append(" ")
                result.append(robot.name)
            }
            return result
        }
    }
    
    func getWinningTeamName() -> String{
        if autoBotVictories > decepticonVictories{
            return "AutoBots"
        }
        else if decepticonVictories > autoBotVictories{
            return "Decepticons"
        }
        else{
            return "Error"
        }
    }
    
    func getLosingTeamName() -> String{
        if autoBotVictories > decepticonVictories{
            return "Decepticons"
        }
        else if decepticonVictories > autoBotVictories{
            return "AutoBots"
        }
        else{
            return "Error"
        }
    }
}
