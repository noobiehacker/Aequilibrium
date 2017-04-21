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
helper.addTransformer();
var addTransformer = true
repeat{
    print("Do you want to enter more names?(Y/N)")
    let name2 = readLine()!
    if(name2 == "Y"){
        helper.addTransformer();
    }else if(name2 == "N"){
        addTransformer = false
    }else{
        print("incorrect input try again")
    }
}
while addTransformer

print("Lets Start The Battle")


