//
//  montyModel.swift
//  Monty Hall game
//
//  Created by MBPRO on 6/27/15.
//  Copyright (c) 2015 MBPRO. All rights reserved.
//

import Foundation

class montyModel {
    var prizeIndex = 0 /* Initiate index to save door with prize */
    var goatIndex = 0 /* Initiate index keep track of Goats doors*/
    var goatIndices = [Int]() /* Array to randomly assign Goats to the two remaining doors */
    var index = 0 /* Initiate index to save user selection */
    var msg = ""
    init(){
        prizeIndex = Int(arc4random() % 3) // Randomly assign prize to any of the three doors
        println(prizeIndex)
        while (goatIndices.count < 2){ // Fill two position in array with either 0,1 or 2
            if(index != prizeIndex){
                goatIndices.append(index) // Asssign Goats the remaining two doors
            }
            index++
        }
    }
    func firstDoorSelected(doorIndex: Int){
        if(doorIndex == prizeIndex){
            goatIndex = goatIndices[Int(arc4random_uniform(2))] // if door selected has the prize, assign Goats randomly to the two reaming doors
        }
        else{
            goatIndex = 3 - doorIndex - prizeIndex // if door selected has not the prize, we put a Goat in the only door left
        }
        msg="You have selected door \(doorIndex+1). Before opening the door selected, you have the change to switch to door \(4-goatIndex-doorIndex)"
    }
    
    func openDoor() -> Int{
        return goatIndex
    }
    
    func finalOption(selection: Int) -> Bool{
        if(selection == prizeIndex){
            return true
        }
        else{
            return false
        }
    }
}