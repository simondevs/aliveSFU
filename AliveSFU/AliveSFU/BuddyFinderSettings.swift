//
//  BuddyFinderSettings.swift
//  AliveSFU
//
//  Created by Gur Kohli on 2016-11-29.
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import UIKit

class BuddyFinderSettings: UIViewController {
    
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet var ageGroup: [UIButton]!
    @IBOutlet var fitnessFrequency: [UIButton]!
    @IBOutlet var personalGoals: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    @IBAction func selectFitnessFrequency(_ sender: UIButton) {
        //Dismiss all the keyboards
        self.view.endEditing(true)
        
        for button in fitnessFrequency {
            if (button == sender) {
                button.isSelected = true
            } else {
                button.isSelected = false
            }
        }
    }
    
    @IBAction func selectAgeGroup(_ sender: UIButton) {
        //Dismiss all the keyboards
        self.view.endEditing(true)
        
        for button in ageGroup {
            if (button == sender) {
                button.isSelected = true
                
            } else {
                button.isSelected = false
            }
        }
    }
    
    @IBAction func selectPersonalGoals(_ sender: UIButton) {
        //Dismiss all the keyboards
        self.view.endEditing(true)
        sender.isSelected = !sender.isSelected
    }

    @IBAction func cancelButton(_ sender: UIButton) {
         self.navigationController?.popToRootViewController(animated: true)
    }
    
}
