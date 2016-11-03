//
//  AddCardioExercise.swift
//  AliveSFU
//
//  Created by Gur Kohli on 2016-10-26.
//  Copyright © 2016 SimonDevs. All rights reserved.
//


//questions: to which page should it go back to after save and cancel
//just connect cancel back to main page. (why do i need to delete, will need that when we implement a data structure)
//check class input types
//clicking save if nothing is entered gives an error
import UIKit

//making a temporary array for testing
var tempArray1: [Exercise] = []


class AddCardioExercise: UIViewController {
    
    //Mark: Properties
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cardioLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var exerciseNameInput: UITextField!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var speedInput: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeInput: UITextField!
    @IBOutlet weak var resistanceLabel: UILabel!
    @IBOutlet weak var resistanceInput: UITextField!
    
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
        
        
        
        if ((exerciseNameInput.text != nil) && (timeInput.text != nil))
        {
            //let exerciseName1 = exerciseNameInput.text
            //var resistance1: Int = resistanceInput.text
            //var speed1: Int = speedInput.text
            //var time1: Int = timeInput.text
            
            let newExercise = Exercise()
            newExercise.exerciseName = exerciseNameInput.text!
            newExercise.resistance = resistanceInput.text!
            
            if (speedInput.text != nil){
            newExercise.speed = speedInput.text!
            }
            
            if (timeInput.text != nil){
            newExercise.time = timeInput.text!
            }
            
            newExercise.categories = "Cardio"
            tempArray1.append(newExercise)
            
            
            //Code for testing
            for element in tempArray1
            {
                element.printName()
                element.printResistance()
                element.printSpeed()
                element.printTime()
                
            }
            
        }
    }
    
    
    @IBAction func cancelButton(_ sender: UIButton) {
        
    }
}

