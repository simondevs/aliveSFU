//
//  AddCardioExercise.swift
//  AliveSFU
//
//  Created by Gur Kohli on 2016-10-26.
//  Developers: Gur Kohli, Gagan Kaur
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import UIKit

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
        if ((exerciseNameInput.text != "") && (timeInput.text != ""))
        {
            let newExercise = Exercise()
            newExercise.exerciseName = exerciseNameInput.text!
            newExercise.resistance = resistanceInput.text!
            newExercise.category = newExercise.CATEGORY_CARDIO
            if (speedInput.text != nil) {
                newExercise.speed = speedInput.text!
            }
            if (timeInput.text != nil) {
                newExercise.time = timeInput.text!
            }
            let result = DataHandler.saveElementToExerciseArray(elem: newExercise)
            if (result == -1) {
                //Handle Error
            }
            
            DataHandler.getExerciseArray()
            self.navigationController?.popToRootViewController(animated: true)
        } else {
            //Do something
        }
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

