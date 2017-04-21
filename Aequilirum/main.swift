//
//  main.swift
//  Aequilirum
//
//  Created by David Kwok Ho Chan on 4/17/17.
//  Copyright © 2017 David Kwok Ho Chan. All rights reserved.
//

import Foundation

let helper = UIHelper.init()

print("Welcome To The Aequilibrium")

//Write a Command Line Program to read in robots one by one
var transformers :[Transformer] = []
transformers.append(helper.addTransformer());
var addTransformer = true
repeat{
    print("Do you want to enter more Transformers?(Y/N)")
    let name2 = readLine()!
    if(name2 == "Y"){
        transformers.append(helper.addTransformer());
    }else if(name2 == "N"){
        addTransformer = false
    }else{
        print("incorrect input try again")
    }
}
while addTransformer

print("Lets Start The Battle")

let company = TransformationCompany.init()
let result = company.computeBattleResult(robots: transformers)
result.displayResult()


