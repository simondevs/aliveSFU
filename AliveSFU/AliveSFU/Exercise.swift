//
//  Exercise.swift
//  AliveSFU
//
//  Created by Gagan Kaur on 2016-10-29.
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import Foundation

class Exercise {
    var exerciseName: String = ""
    var sets: String = ""
    var reps: String = ""
    var resistance: String = ""
    var speed: String = ""
    var time: String = ""
    var categories: String = ""
    
    //setters
    public func setName(name: String)
    {
        exerciseName = name
    }
    
    public func setSets(sets1: String)
    {
        sets = sets1
    }
    
    public func setReps(reps1: String)
    {
        reps = reps1
    }
    
    public func setTime(time1: String)
    {
        time = time1
    }
    
    public func setResistance(resistance1: String)
    {
        resistance = resistance1
    }
    
    //getters
    public func printName()
    {
        print(exerciseName)
    }
    
    public func printSets()
    {
        print(sets)
    }
    
    public func printReps()
    {
        print(reps)
    }
    public func printSpeed()
    {
        print(speed)
    }
    
    public func printTime()
    {
        print(time)
    }
    
    public func printResistance()
    {
        print(resistance)
    }
    
    
}
