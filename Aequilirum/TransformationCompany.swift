//
//  TransformationCompany.swift
//  Aequilirum
//
//  Created by David Kwok Ho Chan on 4/17/17.
//  Copyright © 2017 David Kwok Ho Chan. All rights reserved.
//

import Foundation

class TransformationCompany{
    
    init(){
    }
    
    func computeBattleResult(robots : [Transformer]) -> BattleResult{
        var battleCounts = 0;
        //1)First Sort Array
        var sortedRobots = robots.sorted{ $0.rank < $1.rank }
        //2)Split into Autobots and Decepticons
        var autobots = sortedRobots.filter({$0.machineType == Transformer.type.Autobot});
        var decepticons = sortedRobots.filter({$0.machineType == Transformer.type.Decepticon});
        //3)Write a while loop, and we exit the loop when we have no more autobots or decepticons'
        var autoBotVictories = 0;
        var decepticonVictories = 0;
        var survivingAutobots : [Transformer] = []
        var survivingDecepticons : [Transformer] = []
        while(autobots.count > 0 && decepticons.count > 0){
            //3i)Call determineWinner function one by one, and increment score for battleCount for each function call(Also keep an elimination count for how many autobots/decepticons are elimated
            let decepticon = decepticons.popLast()
            let autobot = autobots.popLast()
            var result : Transformer?
            if(endOfWorld(robotA: autobot!, robotB: decepticon!)){
                return BattleResult(battleCounts: battleCounts, autoBotVictories: autoBotVictories, decepticonVictories: decepticonVictories, worldEnd: true, winningTeam : autobots, losingTeam : decepticons)
            }else{
                result = determineWinner(robotA: autobot!, robotB: decepticon!)
            }
            battleCounts += 1;
            //3ii)Determine what to do with result
            if result == nil{
                autoBotVictories += 1;
                decepticonVictories += 1;
            }else if(result?.machineType == Transformer.type.Autobot){
                autoBotVictories += 1;
                survivingAutobots.append(result!)
            }else if(result?.machineType == Transformer.type.Decepticon){
                decepticonVictories += 1;
                survivingDecepticons.append(result!)
            }
            while(autobots.count > 0){
                survivingAutobots.append(autobots.popLast()!)
            }
            while(decepticons.count > 0){
                survivingDecepticons.append(decepticons.popLast()!)
            }
        }
        //4)Return Number of Battles Count
        if autoBotVictories > decepticonVictories{
            return BattleResult(battleCounts: battleCounts, autoBotVictories: autoBotVictories, decepticonVictories: decepticonVictories, worldEnd: false, winningTeam : survivingAutobots, losingTeam : survivingDecepticons);
        }else{
            return BattleResult(battleCounts: battleCounts, autoBotVictories: autoBotVictories, decepticonVictories: decepticonVictories, worldEnd: false, winningTeam : survivingDecepticons, losingTeam : survivingAutobots);
        }
     
    }

    func determineWinner(robotA : Transformer, robotB : Transformer) -> Transformer?{
        if(isOptimusPrime(robot: robotB) || isPredaking(robot: robotB)){
            return robotB;
        }else if(isOptimusPrime(robot: robotA) || isPredaking(robot: robotA)){
            return robotA;
        }
        else if(robotA.courage <= robotB.courage - 4 && robotA.strength <= robotB.strength - 3){
            return robotB;
        }else if(robotB.skill - 3 >= robotA.skill){
            return robotB;
        }else if(robotB.courage <= robotA.courage - 4 && robotB.strength <= robotA.strength - 3){
            return robotA;
        }else if(robotA.skill - 3 >= robotB.skill){
            return robotA;
        }else if(robotA.computerOverAllRating() == robotB.computerOverAllRating()){
            return nil;
        }else if(robotB.computerOverAllRating() > robotA.computerOverAllRating()){
            return robotB;
        }else{
            return robotA;
        }
    }
    
    func isOptimusPrime(robot : Transformer) -> Bool{
        return robot.name == "Optimus Prime"
    }
    
    func isPredaking(robot : Transformer) -> Bool{
        return robot.name == "Predaking"
    }
    
    func endOfWorld(robotA : Transformer , robotB : Transformer) -> Bool{
        if((isOptimusPrime(robot: robotA) || isPredaking(robot: robotA)) &&
            (isOptimusPrime(robot: robotB) || isPredaking(robot: robotB))){
            return true
        }
        return false;
    }
    
}
