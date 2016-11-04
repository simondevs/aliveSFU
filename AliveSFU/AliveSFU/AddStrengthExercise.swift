//
//  AddStrengthExercise.swift
//  AliveSFU
//
//  Created by Gur Kohli on 2016-10-26.
//  Editted by Vivek Sharma on 2016-11-02
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import UIKit

//making a temporary array for testing
var tempArray: [Exercise] = []


class AddStrengthExercise: UIViewController {
    
    //Mark: Properties
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var exerciseNameInput: UITextField!
    @IBOutlet weak var setsLabel: UILabel!
    
    @IBOutlet weak var setsInput: UITextField!
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var repsInput: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    //Vivek:
    var exerciseDayStrength: Int = 0    //variable that will store the result from what is chosen on the segmented display
    //Vivek: Whenever the segmented display is touched, the int corresponding to the day will
    //be stored in the variable "exerciseDay"
    //Vivek:

    @IBAction func theDayStrength(_ sender: UISegmentedControl) {
        exerciseDayStrength = sender.selectedSegmentIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark: Action
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        
        
        //***check for valid values like max number of characters
        // that can be entered etc.
        
        // create a new object
        
        if (exerciseNameInput.text != nil && setsInput.text != nil && repsInput.text != nil)
        {
            let newExercise = Exercise()
            
            newExercise.exerciseName = exerciseNameInput.text!
            newExercise.sets = setsInput.text!
            newExercise.reps = repsInput.text!
            
            newExercise.categories = "Strength"
            
            //Vivek: updating the day field
            newExercise.setDay(day1: exerciseDayStrength)
            tempArray.append(newExercise)
            
            
            //Code for testing
            for element in tempArray
            {
                element.printName()
                element.printReps()
                element.printSets()
                //Vivek:
                element.printDay()
                
            }
            
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
    }
    
    
}

