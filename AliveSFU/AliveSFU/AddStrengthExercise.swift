//
//  AddStrengthExercise.swift
//  AliveSFU
//
//  Created by Gur Kohli on 2016-10-26.
//  Developers: Gur Kohli, Gagan Kaur
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import UIKit

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
        
        // Check for valid values like max number of characters that can be entered etc.
        // Create a new object
        if (exerciseNameInput.text != nil && setsInput.text != nil && repsInput.text != nil) {
            let newExercise = Exercise()
            newExercise.category = newExercise.CATEGORY_STRENGTH
            newExercise.exerciseName = exerciseNameInput.text!
            newExercise.sets = setsInput.text!
            newExercise.reps = repsInput.text!
            
            let result = DataHandler.saveElementToExerciseArray(elem: newExercise)
            if (result == -1) {
                //Handle Error
            }
            DataHandler.getExerciseArray()
            self.navigationController?.popToRootViewController(animated: true)
        } else {
            
        }
    }

    @IBAction func cancelButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
   

}

