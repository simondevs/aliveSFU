//
//  HomePageController.swift
//  AliveSFU
//
//  Created by Gur Kohli on 2016-10-26.
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import UIKit
import CoreMotion

class HomePageController: UIViewController {

    @IBOutlet weak var stepCount: UILabel!
    @IBOutlet weak var todaySleep: UILabel!
    @IBOutlet weak var bmiCount: UILabel!
    @IBOutlet weak var bmrCount: UILabel!
    
   // let activityManager = CMMotionActivityManager()
    let pedoMeter = CMPedometer()
    let calendar = NSCalendar.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calendar = NSCalendar.current
        var comps = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
        comps.hour = 0
        comps.minute = 0
        comps.second = 0
        
        let midnight = calendar.date(from: comps)!
        
        if(CMPedometer.isStepCountingAvailable()){
            
            self.pedoMeter.startUpdates(from: midnight) { (data: CMPedometerData?, error) -> Void in
                DispatchQueue.main.async(execute: { () -> Void in
                    if(error == nil){
                        self.stepCount.text = "\(data!.numberOfSteps)"
                    }
                })
            }
        }//endif
        
        
         //bmi count
         var weight1: Double = 0.0
         var height1: Double = 0.0
         var tempHeight1: Double = 0.0
         var tempHeight2: Double = 0.0
         
         let pd = DataHandler.getPersonalDetails()
         let fd = DataHandler.getFitnessDetails()
         
         var bmiCountResult: Double = 0
        
         weight1 = Double(fd.weight) //weight in kg
         tempHeight1 = Double(fd.heightFeet)*12
         tempHeight2 = Double(fd.heightInches)
         tempHeight2 = tempHeight1 + tempHeight2
         
         height1 = tempHeight2 //height in inches only
         
         tempHeight2 = tempHeight2*0.025 //height in inches * 0.025
         tempHeight2 = tempHeight2*tempHeight2
         
         bmiCountResult = (weight1/tempHeight2)
         
         self.bmiCount.text = NSString(format: "%.2f", bmiCountResult) as String
         
         //bmr count
         //For men: BMR = 10 x weight (kg) + 6.25 x height (cm) – 5 x age (years) + 5
         //For women: BMR = 10 x weight (kg) + 6.25 x height (cm) – 5 x age (years) – 161
         
        
         var bmrCountResult: Double = 0
         //var weightKg: Float = 0
         var heightCm: Double = height1*2.54
         let ageGroup: Int = fd.ageGroup
         let gender: Int = pd.gender
         var age: Int = 0
         
         //find average group age
         switch ageGroup {
         
         case 0 : age = 18 //ageGroup: 17-20
         case 1 : age = 21 //ageGroup: 20-22
         case 2 : age = 23 //ageGroup: 22-25
         case 3 : age = 27 //ageGroup: 25-30
         default : age = 30 //ageGroup: 30+
         
         }
         
         if (gender == 1) //Female
         {
         var temp1: Double = Double(10*weight1)
         var temp2: Double = Double(6.25*heightCm)
         var temp3: Double = Double(5*age)
         bmrCountResult = temp1+temp2-temp3-161
         }
         else //Male
         {
         var temp1: Double = Double(10*weight1)
         var temp2: Double = Double(6.25*heightCm)
         var temp3: Double = Double(5*age)
         bmrCountResult = temp1+temp2-temp3+5
         }
         
         self.bmrCount.text = NSString(format: "%.2f", bmrCountResult) as String
        
        //today's sleep
        let weekSleep = DataHandler.getSleepAnalysisData()
        let sleepDate = Date()
        let sleepCalendar = Calendar(identifier: .gregorian)
        let sleepDay = sleepCalendar.component(.day, from: sleepDate)
        //let dayOfWeek = components
        
        let sleep = weekSleep[sleepDay]
        
        self.todaySleep.text = NSString(format: "%.2f", sleep) as String
        
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

    @IBAction func openMyProfile(_ sender: Any) {
    }

}

