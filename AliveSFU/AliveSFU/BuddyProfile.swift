//
//  BuddyProfile.swift
//  AliveSFU
//
//  Created by Gur Kohli on 2016-11-30.
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import Foundation

protocol BuddyProfile {
    
}

class BuddyDetails: BuddyProfile {
    internal var gender: Int = -1
    internal var ageGroup: Int = -1
    internal var fitnessFreq: Int = -1
    internal var personalGoals: String = ""
    
    init() {
        self.ageGroup = -1
        self.fitnessFreq = -1
        self.personalGoals = ""
        self.gender = -1
    }
    
    required init(ageGroup: Int, fitnessFreq: Int, personalGoals: String, gender: Int) {
        self.ageGroup = ageGroup
        self.fitnessFreq = fitnessFreq
        self.personalGoals = personalGoals
        self.gender = gender
    }
}
