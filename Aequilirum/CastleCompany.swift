//
//  CastleCompany.swift
//  Aequilirum
//
//  Created by David Kwok Ho Chan on 4/17/17.
//  Copyright © 2017 David Kwok Ho Chan. All rights reserved.
//

import Foundation

class CastleCompany{
    
    init(){
        
    }
    
    //Return number of castles
    func numberOfCastle(land : [Int]) -> Int{
        //Number of castles is equal to number of peaks & valleys
        return computePeaks(land: land)+computeValleys(land: land);
    }
    
    func computePeaks(land : [Int]) -> Int{
        
        //Assuming we can always build a castle at the start of array
        var count = 1;
        //1)Loop through array
        for index in 0...land.count{
            if(index + 2 < land.count){
                //2)If there are three consecutive location, said A , B , C with
                //B-A is Positive and C-B is Negative, we increment count
                let firstDiff = land[index + 1] - land[index];
                let secondDiff = land[index + 2] - land[index + 1];
                if(firstDiff > 0 && secondDiff < 0){
                    count += 1;
                }
            }
        }
        //3)Return total count
        return count;
    }
    
    func computeValleys(land : [Int]) -> Int{
        var count = 1;
        //1)Loop through array
        for index in 0...land.count{
            if(index + 2 < land.count){
                //2)If there are three consecutive location, said A , B , C with
                //B-A is Negative and C-B is Positive, we increment count
                let firstDiff = land[index + 1] - land[index];
                let secondDiff = land[index + 2] - land[index + 1];
                if(firstDiff < 0 && secondDiff > 0){
                    count += 1;
                }
            }
        }
        //3)Return total count
        return count;
    }
    
}
