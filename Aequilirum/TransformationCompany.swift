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
    
    func computeNumberOfBattles(robots : [Transformer]) -> Int{
        var battleCounts = 0;
        //1)First Sort Array
        //2)Split into Autobots and Decepticons
        //3)Write a while loop, and we exit the loop when we have no more autobots or decepticons
        //3i)Call determineWinner function one by one, and increment score for battleCount for each function call(Also keep an elimination count for how many autobots/decepticons are elimated
        //4)Return Number of Battles Count
        return battleCounts;
    }

    func determineWinner(robotA : Transformer, robotB : Transformer) -> Transformer?{
        if(endOfWorld(robotA: robotA, robotB: robotB)){
            return robotA;
        }else if(isOptimusPrime(robot: robotB) || isPredaking(robot: robotB)){
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
