//
//  MyProgressController.swift
//  AliveSFU
//
//  Created by Gur Kohli on 2016-10-26.
//  Developers: Liam O'Shaughnessy
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import UIKit
import CoreData

class MyProgressController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!

    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftEdge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector (handleSwipes(_:)))
        
        let rightEdge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector (handleSwipes(_:)))
        
        leftEdge.edges = .left
        rightEdge.edges = .right
        
        view.addGestureRecognizer(leftEdge)
        view.addGestureRecognizer(rightEdge)
        // Do any additional setup after loading the view, typically from a nib.
        for view in stackView.subviews {
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        populateStackView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        for view in stackView.subviews {
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
    
    override func viewDidLayoutSubviews() {
        print(stackView.frame.height)
        scrollView.contentSize.height = stackView.frame.height + 200
        scrollView.isScrollEnabled = true;
        scrollView.isUserInteractionEnabled = true;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showPopup(_ sender: Any) {
        let popoverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tilePopUpID") as! ExerciseTileViewController
        self.addChildViewController(popoverVC)
        popoverVC.view.frame = self.view.frame
        self.view.addSubview(popoverVC.view)
        popoverVC.didMove(toParentViewController: self)
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
    
    func populateStackView() {
        let exerciseArrayCount = DataHandler.getExerciseArrayCount()
        if (exerciseArrayCount == 0) {
            //Display Placeholder Exercise Tile
            print("Works")
        } else {
            //Populate Exercise Tiles
            let exerciseArray = DataHandler.getExerciseArray()

            for elem in exerciseArray {
                if (elem.category == elem.CATEGORY_CARDIO) {
                    let tile = CardioTileView(name: elem.exerciseName, time: elem.time, speed: elem.speed, resistance: elem.resistance)

                    let tapGesture = UITapGestureRecognizer(target: self, action:  #selector (self.showPopup(_:)))
                    tile.addGestureRecognizer(tapGesture)

                    stackView.addArrangedSubview(tile)
                } else {
                    let tile = StrengthTileView(name: elem.exerciseName, sets: elem.sets, reps: elem.reps)

                    let tapGesture = UITapGestureRecognizer(target: self, action:  #selector (self.showPopup(_:)))
                    tile.addGestureRecognizer(tapGesture)

                    stackView.addArrangedSubview(tile)
                }
                print("Stack Height: ", stackView.frame.height)
            }
        }
    }
    
    func createTile() {
        
    }
}

