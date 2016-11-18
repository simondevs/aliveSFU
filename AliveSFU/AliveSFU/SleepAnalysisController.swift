//
//  SleepAnalysisController.swift
//  AliveSFU
//
//  Created by Gur Kohli on 2016-10-26.
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import UIKit

class SleepAnalysisController: UIViewController {
    
    @IBOutlet weak var hoursInBed: UILabel!
    @IBOutlet weak var hoursSlept: UILabel!
    @IBOutlet weak var percentageSpentSleeping: UILabel!
    @IBOutlet weak var timesWokenUp: UILabel!
    @IBOutlet weak var timeTakenToSleep: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

