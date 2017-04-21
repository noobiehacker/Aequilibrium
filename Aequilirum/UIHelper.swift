//
//  UIHelper.swift
//  Aequilirum
//
//  Created by David Kwok Ho Chan on 4/20/17.
//  Copyright © 2017 David Kwok Ho Chan. All rights reserved.
//

import Foundation

class UIHelper{
    
    init(){
    }
    
    func addTransformer() -> Transformer{
        
        //1)Prompt For Transformer Name
        print("Please Enter Transformer Name")
        let name = readLine()!
        print("you just entered " + name + " As Your TransformerName")
        //2)Prompt For Transformer Team Name
        var transformer = Transformer.init(name: name)
        let teamName = promptForTeamNames()
        transformer.machineType = getMachineTypeFromTeamName(teamName: teamName)
        //3)Prompt For Transformer's stat
        transformer.strength = promptForValues(value: "Strength")
        transformer.intelligence = promptForValues(value: "Intelligence")
        transformer.speed = promptForValues(value: "Speed")
        transformer.endurance = promptForValues(value: "Endurance")
        transformer.rank = promptForValues(value: "Rank")
        transformer.courage = promptForValues(value: "Courage")
        transformer.skill = promptForValues(value: "Skill")
        transformer.firepower = promptForValues(value: "FirePower")
        return transformer;
    }
    
    func getMachineTypeFromTeamName(teamName : String) -> Transformer.type{
        let result : Transformer.type?
        if teamName == "Autobots"{
            result = Transformer.type.Autobot
        }else{
            result = Transformer.type.Decepticon
        }
        return result!
    }
    func promptForTeamNames() -> String{
        var teamName = ""
        while(teamName == ""){
            print("Please Enter Team Type Autobots/Decepticon (A/D)")
            var userInput = readLine()!
            if( userInput == "A" || userInput == "a"){
                teamName = "Autobots"
            }
            else if( userInput == "D" || userInput == "d"){
                teamName = "Decepticons"
            }else{
                print("Incorrect Input and please try again")
            }
        }
        print("You Have Just enetered " + teamName + " As your team name")
        return teamName
    }
    
    func promptForValues(value : String) -> Int{
        var correctValue = false
        var result = "0"
        while(!correctValue){
            print("Please Enter a number (1-10) for Transformer's " + value + " value")
            result = readLine()!
            print("You have just entered " + result + " As your " + value + " value")
            if(!isCorrectInput(value: result)){
                print("Incorrect Input")
            }else{
                correctValue = true
            }
        }
        return Int(result)!
    }
    
    func isCorrectInput(value : String) -> Bool{
        if value.characters.count == 1{
            let firstChar = value[value.startIndex]
            if isIntergerValue(value: firstChar) && !valueIsZero(value: firstChar){
                return true
            }else{
                return false
            }
        }else if value.characters.count == 2{
            return (valueIsOne(value: value[value.startIndex])) &&
                (valueIsZero(value: value[value.index(after: value.startIndex)]))
        }else{
            return false
        }
    }
    
    func isIntergerValue(value : Character) -> Bool{
        let lowerBound = 48
        let upperBound = 57
        let asciiValue = Int(value.asciiValue!)
        if (lowerBound <= asciiValue && asciiValue <= upperBound){
            return true;
        }
        return false;
    }
    
    func valueIsZero(value : Character) -> Bool{
        if(isIntergerValue(value: value)){
            let zero : Character = "0"
            return Int(value.asciiValue!) == Int(zero.asciiValue!)
        }
        return false
    }
    
    func valueIsOne(value : Character) -> Bool{
        if(isIntergerValue(value: value)){
            let one : Character = "1"
            return Int(value.asciiValue!) == Int(one.asciiValue!)
        }
        return false
    }

}
