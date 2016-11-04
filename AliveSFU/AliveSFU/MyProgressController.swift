//
//  MyProgressController.swift
//  AliveSFU
//
//  Created by Gur Kohli on 2016-10-26.
//  Liam O'Shaughnessy
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import UIKit

class MyProgressController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftEdge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector (handleSwipes(_:)))
        
        let rightEdge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector (handleSwipes(_:)))
        
        leftEdge.edges = .left
        rightEdge.edges = .right
        
        view.addGestureRecognizer(leftEdge)
        view.addGestureRecognizer(rightEdge)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showPopup(_ sender: Any) {
        
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tilePopUpID") as! ExerciseTileViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    func handleSwipes(_ recognizer: UIScreenEdgePanGestureRecognizer){
        if (recognizer.state == .recognized) {
            
            if(recognizer.edges == .left) {
                print("Swipe Right from left edge ")//dummy code
                }
            if(recognizer.edges == .right) {
                print("Swipe Left from right edge") //dummy code
                }
        }
        
        //NEED TO GET ARRAY DATA AND CHANGE TILES IN THE VIEW CONTROLLER
    }
    
}

