//
//  Transformer.swift
//  Aequilirum
//
//  Created by David Kwok Ho Chan on 4/18/17.
//  Copyright © 2017 David Kwok Ho Chan. All rights reserved.
//

import Foundation

class Transformer{
    
    init(){
        
    }
    
    var strength = 0;
    var intelligence = 0;
    var speed = 0;
    var endurance = 0;
    var rank = 0;
    var courage = 0;
    var firepower = 0;
    var skill = 0;
    var machineType = type.Autobot;
    
    enum type {
        case Autobot
        case Deception
    }
    
    func computerOverAllRating() -> Int{
        return self.speed + self.strength + self.endurance + self.firepower + self.intelligence;
    }
}
